# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=adwaita-icon-theme
pkgname=$_pkgname-git
pkgver=3.16.0.30.g8cce8aa
pkgrel=1
_realver=3.16.2.1
pkgdesc="GNOME default icons"
arch=(any)
depends=('hicolor-icon-theme' 'icon-naming-utils' 'gtk-update-icon-cache')
makedepends=('git' 'gnome-common' 'automake' 'itstool' 'libxml2' 'yelp-tools' 'intltool' 'librsvg')
url="https://www.gnome.org"
license=('GPL')
groups=('gnome')
install=$_pkgname.install
options=('!emptydirs')
conflicts=('adwaita-icon-theme' 'gnome-icon-theme' 'gnome-icon-theme-symbolic')
provides=("adwaita-icon-theme=${_realver}" "gnome-icon-theme=${_realver}" "gnome-icon-theme-symbolic=${_realver}")
source=('git://git.gnome.org/adwaita-icon-theme')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"  
  ./autogen.sh --prefix=/usr
  make
}

package() {
    cd "$srcdir/$_pkgname"  
    make DESTDIR="$pkgdir" install
    rm -f  "${pkgdir}/usr/share/icons/gnome/icon-theme.cache"
}

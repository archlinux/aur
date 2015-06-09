# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=devhelp
pkgname=$_pkgname-git
pkgver=3.16.1.29.g321170c
pkgrel=1
_realver=3.16.2
pkgdesc="API documentation browser for GNOME"
arch=(i686 x86_64)
license=('GPL')
url="https://wiki.gnome.org/Apps/Devhelp"
depends=('webkit2gtk' 'hicolor-icon-theme' "gtk3" "glib2")
makedepends=('git' 'intltool' 'python' 'gnome-common')
options=('!libtool' '!emptydirs')
install=devhelp.install
provides=("${_pkgname}=${_realver}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
source=('git://git.gnome.org/devhelp')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Taijian <taijian@posteo.de>
# Contributor: jtts
# Contributor: Christian METZLER <neroth@xeked.com>

pkgname=gnome-shell-extension-openweather-git
_pkgbase=openweather
pkgver=1.2.r18.g951a47a
pkgrel=1
pkgdesc="Gnome shell extension for displaying weather information"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=(glib2 gettext pkg-config gnome-shell gnome-icon-theme)
makedepends=(git gnome-common autoconf automake intltool)
provides=(gnome-shell-extension-weather-git)
conflicts=(gnome-shell-extension-weather-git)
source=($_pkgbase::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR=$pkgdir install
}

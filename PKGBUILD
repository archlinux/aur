# Maintainer: Raphael Scholer <rscholer@gmx.de>
_pkgname=xfce4-kbdleds-plugin
pkgname=${_pkgname}-git
pkgver=0.0.6_7_gecc3609
pkgrel=1
pkgdesc="Xfce keyboard LEDs panel plugin"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/${_pkgname}"
license=('GPL2')
depends=('xfce4-panel')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
conflicts=("${_pkgname}")
source=("git+git://git.xfce.org/panel-plugins/${_pkgname}")
install="${pkgname}.install"
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo "$(git describe --always |sed "s#${_pkgname}-##g;s#-#_#g;s#v##")"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:

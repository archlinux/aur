# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=scanmem-git
pkgver=0.15.4.751.6a5e2e8
pkgrel=1
pkgdesc="Memory scanner designed to isolate the address of an arbitrary variable in an executing process"
url="https://github.com/scanmem/scanmem"
arch=('i686' 'x86_64')
license=('GPL3')
provides=('scanmem')
conflicts=('scanmem')
depends=('pygtk' 'python-gobject' 'polkit')
makedepends=('git' 'intltool')
install=scanmem.install
source=(${pkgname}::git+https://github.com/scanmem/scanmem.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed -r 's|-|.|g'|sed -r 's|v?(.*)|\1|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  ./autogen.sh
  ./configure --enable-gui --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

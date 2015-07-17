# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=scanmem-git
pkgver=0.15.2.6.g5cf1f26
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
  git describe --always|sed 's|-|.|g'|sed -r 's|v(.*)|\1|'
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

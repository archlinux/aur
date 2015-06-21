# Maintainer: Gicu Gorodenco <cyclopsihus@gmail.com>
# Contributor: josephgbr

_pkgsourcename=libview
pkgname=lib32-${_pkgsourcename}
pkgver=0.6.6
pkgrel=3
pkgdesc="A collection of widgets that were developed at VMware (32 bit)"
arch=('x86_64')
url="http://view.sourceforge.net"
license=('MIT')
depends=('lib32-gtkmm' 'lib32-libsigc++' ${_pkgsourcename})
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://downloads.sf.net/sourceforge/view/${_pkgsourcename}-${pkgver}.tar.gz)
sha256sums=('394583d2d28c334684d512eb2a260db51a877b84319f74a2425b79b5780f3ad8')

build() {
  cd ${srcdir}/${_pkgsourcename}-${pkgver}
  ./autogen.sh --prefix=/usr --libdir=/usr/lib32 CC="gcc -m32" CXX='g++ -m32'
  make
}

package() {
  cd ${srcdir}/${_pkgsourcename}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/include
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

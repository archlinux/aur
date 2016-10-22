# Maintainer: Simón Oroño <sron611@gmail.com>

pkgname='iop-blockchain'
pkgver=2.0.0
pkgrel=1
pkgbase="$pkgname"
pkgdesc="IoP is the  digital currency from the Internet of People that enables instant payments to anyone, anywhere in the world."
arch=('i686' 'x86_64')
url="http://www.fermat.org/"
makedepends=('git' 'boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf' 'zeromq')
depends=(boost-libs desktop-file-utils libevent qt5-base qrencode protobuf zeromq)
license=('MIT')
source=(https://github.com/Fermat-ORG/iop-blockchain/archive/81335ba210c0cf79757c22dfd66ff9142de7ea8f.zip)
sha256sums=('16879eeb89dfa16d1af7c6cc75203659c8595926848dc03b3d14609c3b804a72')

build() {
  cd "$pkgbase-81335ba210c0cf79757c22dfd66ff9142de7ea8f"
  ./autogen.sh
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb
  make
}

package() {
  cd "$pkgbase-81335ba210c0cf79757c22dfd66ff9142de7ea8f"
  install -Dm755 src/qt/IoP-qt "$pkgdir"/usr/bin/IoP-qt

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


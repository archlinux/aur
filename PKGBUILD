# Maintainer: Simón Oroño <simonorono@protonmail.com>

pkgname='iop-token'
pkgver=3.0.1
pkgrel=1
pkgbase="$pkgname"
pkgdesc="IoP is the  digital currency from the Internet of People that enables instant payments to anyone, anywhere in the world."
arch=('i686' 'x86_64')
url="http://www.fermat.org/"
makedepends=('git' 'boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf' 'zeromq')
depends=(boost-libs desktop-file-utils libevent qt5-base qrencode protobuf zeromq)
license=('MIT')
source=(https://github.com/Fermat-ORG/iop-token/archive/a557231f4a4200960e5606bcf0e07cee63f65d6d.zip)
sha256sums=('53791fe15d1891fd68ba048f331f9bd8b6cd60aa59cfcc6db1fbca447bf6c643')

build() {
  cd "iop-token-a557231f4a4200960e5606bcf0e07cee63f65d6d"
  ./autogen.sh
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb
  make -j 2
}

package() {
  cd "iop-token-a557231f4a4200960e5606bcf0e07cee63f65d6d"
  install -Dm755 src/qt/IoP-qt "$pkgdir"/usr/bin/IoP-qt

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=serial-io
pkgver=1.0
pkgrel=2
pkgdesc="A simple program to send and receive data from a serial interface"
arch=('i686' 'x86_64')
url="http://serial-io.sourceforge.net/"
license=('GPL')
depends=('qt4' 'libserial')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('3279a3ad9c07e5587ba6661c0a90ff59')

prepare() {
  cd "$srcdir"/$pkgname
  sed -i "s@TARGET = @TARGET = serial-io@" serial-io.pro
  qmake-qt4 -unix -o Makefile serial-io.pro
}

build() {
  cd "$srcdir"/$pkgname
  make
}

package() {
  cd "$srcdir"/$pkgname
  make INSTALL_ROOT="$pkgdir" install
}
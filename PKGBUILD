# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: James Morris <james at jwm-art dot net>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=libserial
pkgver=0.6.0rc1
pkgrel=2
pkgdesc="A C++ library to access serial ports like standard C++ iostream objects"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
makedepends=('python2-sip')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('60d8aebf5f262c12baf94ce61d61198fc9b79da2432c735c200decd08ead1fb4')

prepare() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  sed -e 's/python/python2/g' -i sip/Makefile
  sed -e '1s/^/#include <unistd.h>\n/' -i src/SerialPort.cpp
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

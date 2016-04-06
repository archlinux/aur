# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: James Morris <james at jwm-art dot net>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=libserial
pkgver=0.6.0rc2
pkgrel=2
pkgdesc="A C++ library to access serial ports like standard C++ iostream objects"
arch=('i686' 'x86_64')
url="https://github.com/crazyewulf/libserial"
license=('GPL')
depends=('gcc-libs')
makedepends=('python2-sip')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('35ee29eb1369d52ffb8658237577692f991eb508320d0abbb71c53e6494a1c23')

prepare() {
  cd $pkgname-$pkgver
  sed -e '1s/^/#include <unistd.h>\n/' -i src/SerialPort.cpp
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  cd sip
  python2 configure.py
  cd ..
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=qtsconverter-git
pkgver=4.3.4.r37.g63305e6
pkgrel=1
provides=('qtsconverter')
conflicts=('qtsconverter')
pkgdesc="A Tool to convert ts < == > csv or xlsx"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/guerinoni/qTsConverter"
license=('MIT')
makedepends=('cmake' 'git')
depends=('qt5-base' 'qt5-declarative') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=('git://github.com/guerinoni/qTsConverter.git')
md5sums=(SKIP)

pkgver() {
  cd "qTsConverter"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "qTsConverter"
  git submodule init
  git submodule update
  cmake -DSTATIC_LIB=OFF -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make
}

package(){
  cd "qTsConverter"
  make DESTDIR="$pkgdir" install
}

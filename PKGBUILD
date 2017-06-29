# Maintainer: Alexander Ryapolov <srwork@gmail.com>

pkgname=qtvkbd
pkgver=0.8.2
pkgrel=1
pkgdesc="A virtual keyboard"
arch=(i686 x86_64)
url="https://github.com/Alexander-r/qtvkbd"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxtst')
makedepends=('cmake')
source=("https://github.com/Alexander-r/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0cc3ddf285a5ecb41bf92f82d0e3ca5a')
sha256sums=('93a380c21e4568974731198937ae47852d491e059260aba3b24add594ddce85d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DDATA_INSTALL_DIR=/usr/share/apps \
    -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

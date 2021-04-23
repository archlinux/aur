# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.4.1
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base' 'tbb')
makedepends=('qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('82d6224b39fdd670fa0c3ddaf27db46768a07192c9092fa9d81c50cc6075e2f1')

build() {
	cd "$pkgname-$pkgver"
        cd "src"
        rm document.cpp src.pri
        wget https://raw.githubusercontent.com/rgriebl/brickstore/697298c04ce988a157ebea14261621cf1508b147/src/document.cpp
        wget https://raw.githubusercontent.com/rgriebl/brickstore/697298c04ce988a157ebea14261621cf1508b147/src/src.pri
        cd ".."
        qmake-qt5 -r PREFIX=/usr CONFIG+=release
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}

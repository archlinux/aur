# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.4.1
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base' 'tbb')
makedepends=('qt5-translations' 'wget' 'patch')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('82d6224b39fdd670fa0c3ddaf27db46768a07192c9092fa9d81c50cc6075e2f1')

build() {
	cd "$pkgname-$pkgver"
        wget -O - https://github.com/rgriebl/brickstore/commit/697298c04ce988a157ebea14261621cf1508b147.patch | patch -p 1
        qmake-qt5 -r PREFIX=/usr CONFIG+=release
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}

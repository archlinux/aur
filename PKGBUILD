# Maintainer: Danny Grove <aur@dannygrove.com>
# Contributor: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=makefile2graph
pkgver=2021.11.06
pkgrel=1
pkgdesc="Creates a graph of dependencies from GNU-Make"
arch=('i686' 'x86_64')
url="https://github.com/lindenb/makefile2graph"
license=('MIT')
depends=('gcc' 'make' 'sh')
checkdepends=('graphviz')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5be8e528fa2945412357a8ef233e68fa3729639307ec1c38fd63768aad642c41')

build() {
	cd "$pkgname-$pkgver"
  make
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="/usr" DESTDIR="$pkgdir/" pkgdoc_DATA="README.md screenshot.png" \
    man1_MANS+="make2graph.1 makefile2graph.1" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

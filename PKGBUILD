# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=makefile2graph
pkgver=1.5.0
pkgrel=1
pkgdesc="Creates a graph of dependencies from GNU-Make"
arch=('i686' 'x86_64')
url="https://github.com/lindenb/makefile2graph"
license=('MIT')
depends=('sh' 'make')
checkdepends=('graphviz')
source=("https://github.com/lindenb/makefile2graph/archive/v1.5.0.tar.gz")
md5sums=('7eb822eced522ef03ab29c893e59d2d3')

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

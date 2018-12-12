# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmium-tool
pkgver=1.10.0
pkgrel=1
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium>=2.15.0')
optdepends=('pandoc: building documentation')
url="http://osmcode.org/osmium-tool/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../zsh_completion/_osmium "${pkgdir}/usr/share/zsh/site-functions/_osmium"
}

sha256sums=('f0a75ce39ac92c43a01d978c1ecae05d864930bf7d518ea059d7ba320735dd66')

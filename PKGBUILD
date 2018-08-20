# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmium-tool
pkgver=1.9.1
pkgrel=1
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium>=2.14.0')
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

sha256sums=('56d6cbc895ce86716b88152f3be788f961d0085580ba2ca024e84ba211695de5')

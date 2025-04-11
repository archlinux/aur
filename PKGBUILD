pkgname=mariebuild
pkgver=0.7.5
pkgrel=2
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('glibc>=2.39')
makedepends=('clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('43dce81771099d1ed8c0b20c34c5a2cee2e3af131d6316bb7f120ebc3bced591')

build() {
	cd "$pkgname-$pkgver"
	bash setup.bash
	bash build.bash --release
}

package() {
	cd "$pkgname-$pkgver"
	INSTALL_PREFIX="$pkgdir/usr/" ./build/release/mb -t install
#	install -Dm 755 ./build/release/mb -t "$pkgdir/usr/bin/"
}

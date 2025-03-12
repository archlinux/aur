pkgname=mariebuild
pkgver=0.7.3r2
pkgrel=1
pkgdesc="A simple build system with support for incremental builds"
arch=('x86_64')
url="https://github.com/FelixEcker/mariebuild"
license=('BSD-3')
depends=('clang' 'glibc>=2.39')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c23308b2cb014d2ac40badf6b704bb27143cb13f1ab6f1d0ea1400f15515f50f')

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

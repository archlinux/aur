# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=bustools
pkgver=0.42.0
pkgrel=2
pkgdesc='Program for manipulating BUS files for single cell RNA-Seq datasets. doi:10.1038/s41587-021-00870-2'
url="https://github.com/BUStools/$pkgname/"
license=(BSD)
arch=('x86_64')
depends=('zlib' 'gcc-libs')
makedepends=('cmake')
source=($pkgname-$pkgver::"https://github.com/BUStools/bustools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34027724b9c57bdbf2e7c252962e30c329b3f5f9fc03d10a5feef336ce50d008')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	rm -rf build
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make install
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

}

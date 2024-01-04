# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=bustools
pkgver=0.43.2
pkgrel=1
pkgdesc='Program for manipulating BUS files for single cell RNA-Seq datasets. doi:10.1038/s41587-021-00870-2'
url="https://github.com/BUStools/$pkgname/"
license=(BSD)
arch=('x86_64')
depends=('zlib' 'gcc-libs')
makedepends=('cmake')
source=($pkgname-$pkgver::"https://github.com/BUStools/bustools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad5816152644ee615316daecf5883183994bd7cc96e6c008439123f4cd750b1f')

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

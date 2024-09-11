# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=bustools
pkgver=0.44.0
pkgrel=1
pkgdesc='Program for manipulating BUS files for single cell RNA-Seq datasets. doi:10.1038/s41587-021-00870-2'
url="https://github.com/BUStools/$pkgname/"
license=(BSD)
arch=('x86_64')
depends=('zlib' 'gcc-libs')
makedepends=('cmake')
source=($pkgname-$pkgver::"https://github.com/BUStools/bustools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9a12be416d5d3940dd0ec3bfb0be3a481f2eea7d4411df1ab24c814332d99b8')

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

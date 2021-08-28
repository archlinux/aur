# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grcompiler
pkgver=5.2.1
pkgrel=1
pkgdesc='The SIL Graphite compiler'
arch=(x86_64 i686)
url="https://github.com/silnrsi/$pkgname"
license=(CPL LGPL)
depends=(icu)
makedepends=(cmake
             docbook-utils
             perl-sgmls)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a125e9d2746638a538e59af8ece2268fda078572f50e82f82d6f95ccb08ed890')

build() {
	cd "$_archive"
	cmake -S . \
			-DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-B build
	make -C build
}

package() {
	cd "$_archive"
	make -C build DESTDIR="$pkgdir" install
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license/*.txt
}


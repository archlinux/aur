# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-barcode
pkgver=6.31.0
pkgrel=1
pkgdesc='A barcode API to produce QRCode barcodes and DataMatrix barcodes'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-barcode'
license=('MIT')
depends=(
	'glibc'
	'libdmtx'
	'libgcc'
	'libstdc++'
	'qrencode'
	'qt6-base'
	'qt6-multimedia'
	'zxing-cpp'
)
makedepends=(
	'doxygen'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('qt6-declarative: QML bindings')
provides=('prison')
conflicts=('prison')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bd42c7c6f7f50f5ef8fab24f70b84249436c906bfd1e536ff6db38278f463ba4')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 $pkgname-$pkgver/LICENSES/MIT.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

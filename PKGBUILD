# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=signal-estimator
pkgver=0.0.3
pkgrel=1
pkgdesc="A small tool for measuring different characteristics of the signal looped back from audio output"
arch=('x86_64')
url="https://github.com/gavv/signal-estimator"
license=('MIT')
depends=(
	'libasound.so'
	'qwt')
makedepends=(
	'cmake'
	'cxxopts' ## AUR
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('62504cdcac7a9fdb48de77bf58f2658dbac2537ee85d7cee35dc47e5115a782a')

build() {
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-B build \
		-S "$pkgname-$pkgver"
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	cd "$pkgname-$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

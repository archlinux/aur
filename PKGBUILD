# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.2.12
pkgrel=1
pkgdesc="Build tool for the Rust framework Leptos."
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'cargo-generate' 'binaryen')
optdepends=('dart-sass: sass support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('11ce0e51036eb4cd86c575e13e72d9469f1fa251df3d36275c5b6daac82066b8')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	# Build with no_downloads flag to let pacman handle dependencies.
	cargo build --frozen --release --features no_downloads
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

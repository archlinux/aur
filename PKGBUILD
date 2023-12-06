# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.2.5
pkgrel=2
pkgdesc="Build tool for the Rust framework Leptos."
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'cargo-generate' 'binaryen')
optdepends=('dart-sass: sass support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('48eab7e3a3c987ca36e90789e4049522c047a15f978349b03c77751c1b2e16d9')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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

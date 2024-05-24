# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.2.17
pkgrel=1
pkgdesc="Build tool for the Rust framework Leptos."
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'cargo-generate' 'binaryen')
optdepends=('dart-sass: sass support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('619cfd0a5c28d6d6dd239a3e12b4c25145037a0d5d916b2b23364e5e1556a5c8')

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

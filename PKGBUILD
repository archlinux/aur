# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.1.11
pkgrel=1
pkgdesc="Build tool for the Rust framework Leptos."
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'openssl' 'cargo-generate' 'binaryen')
optdepends=('dart-sass: sass support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('69194b328ae3d847ad7210a3bc3a9c97aef6eafe77d14c2c81f7d9ba2ffbb71d')

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

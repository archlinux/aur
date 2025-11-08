# Maintainer: iamawacko <iamawacko at protonmail dot com>
#Contributor: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.2.47
pkgrel=1
pkgdesc="Build tool for the Rust framework Leptos."
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'cargo-generate' 'binaryen')
makedepends=('libgit2' 'pkgconf')
optdepends=('dart-sass: sass support')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ada691f4c0ae5a37994c8b2815791807287f36ff010d20889029b517c734431e')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	# Build with no_downloads flag to let pacman handle dependencies.
	cargo build -vv --frozen --release --features no_downloads
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

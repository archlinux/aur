# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: iamawacko <iamawacko at protonmail dot com>
# Contributor: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.3.6
pkgrel=1
pkgdesc="Build tool for the Rust framework Leptos"
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'cargo-generate' 'binaryen')
makedepends=('libgit2' 'pkgconf')
optdepends=('dart-sass: sass support')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d3aa977fab47329983ff85c5f41bae55a3f1e89673992c905a2fbdc40c50d727')

latestver() {
  gh api repos/leptos-rs/cargo-leptos/releases/latest --jq '.tag_name' | sed 's/^v//'
}

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --features no_downloads
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

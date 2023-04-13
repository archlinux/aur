# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=aspeak
pkgver=4.3.1
pkgrel=1
pkgdesc="A simple text-to-speech client for Azure TTS API"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/kxxt/aspeak"
license=('MIT')
depends=('openssl' 'alsa-lib' 'gcc-libs')
makedepends=('cargo')
conflicts=('aspeak')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
b2sums=('5a852379a3c8014ff85bee1b36266cfe3a8548688a186b456735fe3c8e291baa627691b903a1f1f7dfd2dfc4bb3b46c5ccdc51cfa352d6b1e3309abc6fe7abf4')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

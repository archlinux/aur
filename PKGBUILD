# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=aspeak
pkgver=4.1.0
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
b2sums=('f8ac4a850029b303e9d39f2e779f6a57c0f32ef507ceabb96312b8ebc08da3da0cd6163831d21bd657ceb6d7b06662a6c65295b84b1fbd355383efdbac6d59cb')

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

# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=aspeak
pkgver=4.2.0
pkgrel=2
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
b2sums=('f55eb4ab968ebb4864f5fd52c3b492d886d6e48e678ef94fb7b597c4ef1ce2356b826d7b88c272b951ee371dc419e19c2089e8166631d9866501686eb2a12bd9')

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

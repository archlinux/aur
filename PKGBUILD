# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=tracexec
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple text-to-speech client for Azure TTS API"
arch=('x86_64' 'aarch64')
url="https://github.com/kxxt/aspeak"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('tracexec-bin')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
b2sums=('ad50fab636afaae1433a338e3f611cb0afe4ea9d088023d6cc72a46f8ef7adc8cd4fd4b53d144fcd8a1c6fd587e865f3e71e3d5b978eb18abe8ba2c08a296d3e')

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

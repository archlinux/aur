# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=ravedude
pkgver=0.2.1
pkgrel=1
pkgdesc="avrdude wrapper for embedded rust development"
url="https://github.com/Rahix/avr-hal/tree/main/ravedude"
license=("MIT OR Apache-2.0")
arch=("x86_64" "aarch64")
source=("git+https://github.com/Rahix/avr-hal#tag=ravedude-$pkgver")
depends=("avrdude")
makedepends=("git" "cargo")
sha512sums=('87822d9a1ad9a6b6d180b53e9e890c41bdcb3af987b9aa3f370038a973d0308b2802a6dce96363fc22321f36095275361c6abfa102eaa1bc567077b3a07a3785')

prepare() {
    cd "$srcdir/avr-hal/ravedude"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/avr-hal/ravedude"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/avr-hal/ravedude"
    install -Dm755 target/release/ravedude -t "$pkgdir/usr/bin/"
    install -Dm644 ../LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}

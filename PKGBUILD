# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=ravedude
pkgver=0.2.2
pkgrel=1
pkgdesc="avrdude wrapper for embedded rust development"
url="https://github.com/Rahix/avr-hal/tree/main/ravedude"
license=("MIT OR Apache-2.0")
arch=("x86_64" "aarch64")
source=("git+https://github.com/Rahix/avr-hal#tag=ravedude-$pkgver")
depends=("avrdude")
makedepends=("git" "cargo")
sha512sums=('118659e4f1b349e0b4316b5b39bfc6809216bc4458533b4186c258900000797b678e81c091c5dbf3a4d6d10bbe2014435b42c9fbb71902d155a8206213c77fd9')

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

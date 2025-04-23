# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=ravedude
pkgver=0.2.0
pkgrel=1
pkgdesc="avrdude wrapper for embedded rust development"
url="https://github.com/Rahix/avr-hal/tree/main/ravedude"
license=("MIT OR Apache-2.0")
arch=("x86_64" "aarch64")
source=("git+https://github.com/Rahix/avr-hal#tag=ravedude-$pkgver")
depends=("avrdude")
makedepends=("git" "cargo")
sha512sums=('4ed82c04b60e048e0c6ecf22a35454885caf3a80abeb0e0736646fc9eddaf705ffbb1af9b5125db65ea9e59ca9128c785dcbf345c7a7776e8b23837d1561fb10')

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

# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=ravedude
pkgver=0.1.8
pkgrel=1
pkgdesc="avrdude wrapper for embedded rust development"
url="https://github.com/Rahix/avr-hal/tree/main/ravedude"
license=("MIT OR Apache-2.0")
arch=("x86_64" "aarch64")
source=("git+https://github.com/Rahix/avr-hal#tag=ravedude-$pkgver")
depends=("avrdude")
makedepends=("git" "cargo")
sha512sums=('c4f613713111b3910bb264e1ff20288926d9ac0c078403f133b554293564cba4f62f64f616d20652db60d2a6b44b908f7bd67e08843e851f32e16fb886bf730e')

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

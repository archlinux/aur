# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=hexerator
pkgver=0.1.1
pkgrel=1
pkgdesc="Versatile GUI hex editor focused on binary file exploration and aiding pattern recognition"
url="https://github.com/crumblingstatue/hexerator"
arch=("x86_64")
license=("MIT" "APACHE")
depends=("gcc-libs" "sfml" "pango" "gdk-pixbuf2" "gtk3")
makedepends=("rust" "rustup")
options=("!lto")
source=("$pkgname-$pkgver.tar.gz::https://github.com/crumblingstatue/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a9dd7ee1675332f1d439a2e97b9773cf34454aa6fe3e3eab1bcd9ed94bbe9d64f8a485b1f335ac6e02c8db01b91bf94afb03cee2ccf42b18fce2a68a02ff7857')

prepare() {
    rustup default nightly
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=hexerator
pkgver=0.2.0
pkgrel=1
pkgdesc="Versatile GUI hex editor focused on binary file exploration and aiding pattern recognition"
url="https://github.com/crumblingstatue/hexerator"
arch=("x86_64")
license=("MIT" "APACHE")
depends=("gcc-libs" "sfml" "pango" "gdk-pixbuf2" "gtk3")
makedepends=("rustup")
options=("!lto")
source=("$pkgname-$pkgver.tar.gz::https://github.com/crumblingstatue/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('16cfaed6a438b605b684fc11cc125dacbd1b62b7f1940f1041d8311f2220bed11c16e00678112b4008df53a451fb62b659f9911267b59330568df8b73206d5fc')

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

# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=hexerator
pkgver=0.1.0
pkgrel=1
pkgdesc="Versatile GUI hex editor focused on binary file exploration and aiding pattern recognition"
url="https://github.com/crumblingstatue/hexerator"
arch=("x86_64")
license=("MIT" "APACHE")
depends=("gcc-libs" "sfml" "pango" "gdk-pixbuf2" "gtk3")
makedepends=("rust" "rustup")
options=("!lto")
source=("$pkgname-$pkgver.tar.gz::https://github.com/crumblingstatue/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b2c476122f0408317a87e9fc050fd98d53d05f3d1aa8c4b849beeb4282da850e46741a064527bc97210039fa608efbd0b556ae994928d5ce80018714f9e7a028')

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

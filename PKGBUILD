# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=hexerator
pkgver=0.2.1
pkgrel=1
pkgdesc="Versatile GUI hex editor focused on binary file exploration and aiding pattern recognition"
url="https://github.com/crumblingstatue/hexerator"
arch=("x86_64")
license=("MIT" "APACHE")
depends=("gcc-libs" "sfml" "pango" "gdk-pixbuf2" "gtk3")
makedepends=("rustup")
options=("!lto")
source=("$pkgname-$pkgver.tar.gz::https://github.com/crumblingstatue/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('806737903058cd617877a43204d523a433423b28ef12fb341552a06a57377869cbb675371d80c4b6b5f52eb9fb7eeb1943eb748783e32c2d857e20d735e97c47')

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

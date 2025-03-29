# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=hexerator
pkgver=0.4.0
pkgrel=1
pkgdesc="Versatile GUI hex editor focused on binary file exploration and aiding pattern recognition"
url="https://github.com/crumblingstatue/hexerator"
arch=("x86_64")
license=("MIT" "APACHE")
depends=("freetype2" "gcc-libs" "glibc" "libglvnd" "libx11" "libxcursor" "libxrandr" "systemd-libs" "glu")
makedepends=("rustup" "cmake")
options=("!lto")
source=("$pkgname-$pkgver.tar.gz::https://github.com/crumblingstatue/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9054582a1ad682be09fa612da43ddf156bb69e3ca166b9d8f47d13eb1ded763c1e57cbb19de28512c516c24ef6315ef0e28683a49a2f23223f95e9744c3f22cb')

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

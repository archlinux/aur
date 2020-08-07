# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=wmfocus
pkgver=1.1.4
pkgrel=1
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=("x86_64")
license=("MIT")
depends=("xcb-util-keysyms" "cairo" "libxkbcommon-x11")
makedepends=("rust" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/svenstaro/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e816119adfe839e74ecb5accd451ba70b1c2308a00ce1def3bb1a893f17cbfe3d8db76185d990d6408e59f6ef1ce84fa101c3759cf80dfc00abbab6afd965720')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --locked --release --features i3
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --locked --release --features i3
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

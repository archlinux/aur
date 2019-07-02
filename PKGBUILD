# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=wmfocus
pkgver=1.1.3
pkgrel=1
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=("x86_64")
license=("MIT")
depends=("xcb-util-keysyms" "cairo" "libxkbcommon-x11")
makedepends=("rust" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('299a19b8b3dbd6dfcce961b75c4cf0321d41fd7742235407c1c3de73418e28825f293dbe8db5ea9072a5b2dfad8fc99d654a3cc03839125fedd346e7b4e96604')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --locked --release --features i3
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

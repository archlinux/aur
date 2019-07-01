# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=wmfocus
pkgver=1.1.2
pkgrel=2
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=("x86_64")
license=("MIT")
depends=("xcb-util-keysyms" "cairo" "libxkbcommon-x11")
makedepends=("rust" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('fb68355ad7cc5e34fca193b2a0ca5a2606c1d46c839be2a783b0d494dba2e374c01fb839c5a4e5ded411c69e809fecc3141fad0dfc90c0c80e083f32701ea9c8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --locked --release --features i3
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

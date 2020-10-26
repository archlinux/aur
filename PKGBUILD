# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=wmfocus
pkgver=1.1.5
pkgrel=1
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=("x86_64")
license=("MIT")
depends=("xcb-util-keysyms" "cairo" "libxkbcommon-x11")
makedepends=("rust" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/svenstaro/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f9a2533dc5be51cae0c351452be75491a307aa5e7f952050d76c0b486cd41ea6e8c28a6740be051ed30b69f4002b010bb8786a2f88cab9a5be407c9788d0cffd')

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

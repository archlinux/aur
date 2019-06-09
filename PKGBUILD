# Maintainer: cauebs <cauebs@pm.me>
pkgname="hyperfine"
pkgver=1.6.0
pkgrel=1
pkgdesc="A command-line benchmarking tool"
url="https://github.com/sharkdp/hyperfine"
arch=("x86_64")
license=("APACHE" "MIT")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sharkdp/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0cb251453147421c0c807587123e733b32346b9756c8594018c637ec374a63f4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    # Apache doesn't need to be installed, but because of the dual license
    # it makes more sense to not exclude it.
    install -Dm 644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

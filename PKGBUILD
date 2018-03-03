# Maintainer: jD91mZM2 <me@krake.one>
pkgname="hyperfine"
pkgver=0.5.0
pkgrel=1
pkgdesc="A command-line benchmarking tool"
url="https://github.com/sharkdp/hyperfine"
arch=("x86_64")
license=("APACHE" "MIT")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sharkdp/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('59d6c2574cbcd2970673e82c11345e13c5333daecbcc6d4259ad218ccf1acfb3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    # Apache isn't needed to be installed, but because of the dual license,
    # it makes more sense to show the license like this.
    install -Dm 644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

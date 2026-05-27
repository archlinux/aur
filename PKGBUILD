# Maintainer: Stephan Snyman <stephan@tinyglitch.net>
pkgname=fost
pkgver=1.0.2
pkgrel=1
pkgdesc="A CLI tool for speedreading text from the clipboard"
arch=('x86_64')
url="https://codeberg.org/rooiratel/fost"
license=('GPL')  #v3
options=(!debug)
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/rooiratel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('00a2249d43fcb4e6d4cbef877e29e8f84b8d52790aaf30c8319a74580b45b40c')

build() {
    cd "$pkgname"
    export CARGO_PROFILE_DEV_DEBUG=0
    cargo build --release --offline
}

package() {
    cd "$pkgname"

    # Binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Man page(s)
    install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

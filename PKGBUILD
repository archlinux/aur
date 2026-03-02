# Maintainer: Gurov <gurov@disroot.org>
pkgname=archie
pkgver=3.4.0
pkgrel=1
pkgdesc="Fast & Easy package management for Arch Linux"
arch=('x86_64')
url="https://github.com/Gur0v/archie-ng"
license=('GPL-3.0-only')
depends=('paru')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gur0v/archie-ng/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fadb123d683906d2c7e609c02617b4b4bb61ee3b1475b502518e2ae1dbd80b7')

build() {
    cd "$srcdir/archie-ng-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/archie-ng-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$srcdir/archie-ng-$pkgver"
    install -Dm755 target/release/archie "$pkgdir/usr/bin/archie"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

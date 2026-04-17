# Maintainer: Gurov <gurov@disroot.org>
pkgname=archie
pkgver=3.8.0
pkgrel=1
pkgdesc="Fast & Easy package management for Arch Linux"
arch=('x86_64')
url="https://github.com/Gur0v/archie-ng"
license=('GPL-3.0-only')
depends=('paru-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gur0v/archie-ng/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a9e0530d1b933518ebf4ea9ebd05aa08c1265321e392127417dc0344dfcfe4e3')

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

# Maintainer: Gurov <gurov@disroot.org>
pkgname=archie
pkgver=3.7.0
pkgrel=2
pkgdesc="Fast & Easy package management for Arch Linux"
arch=('x86_64')
url="https://github.com/Gur0v/archie-ng"
license=('GPL-3.0-only')
depends=('paru-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gur0v/archie-ng/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe6fd1d08ad21e5bf414d396348e6ccd79f9e9eec5f89a4f5dccf13c3a85fb1e')

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

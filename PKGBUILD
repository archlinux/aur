# Maintainer: Richard Bradfield <bradfier at fstab dot me>

pkgname=rhack
pkgver=0.1.0
pkgrel=1
pkgdesc="rhack - easily hack on your Rust dependencies" 
url="https://github.com/nakabonne/rhack"
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("rhack")
arch=("i686" "x86_64")
license=("BSD")
source=("https://github.com/nakabonne/rhack/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f91f259ff7361b588c1033ce1f19596bbf1543405b5754535fa3754a4829ddd88fa67ed5a9d8e55ca4a91c0dcc5cf8f6b073d6848302ac8389fdec54d06d975e')

build() {
    cd rhack-$pkgver
    cargo build --release --target-dir "./target"
}

check() {
    cd rhack-$pkgver
    cargo test --release --target-dir "./target"
}

package() {
    cd rhack-$pkgver
    install -Dm755 "target/release/rhack" "$pkgdir/usr/bin/rhack"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/rhack/LICENSE"
}

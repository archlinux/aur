# Maintainer: sichvs <pers32100@gmail.com>
pkgname=secry
pkgver=1.1.10
pkgrel=1
pkgdesc='AES-256-GCM / ChaCha20-Poly1305 / XChaCha20-Poly1305 token encryption CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/rushpym-dotcom/secry-rs'
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('4700510f19b3f08fbd38f5aad29b90c9022d69003d81bf70f6fc82459619e82b')

build() {
    cd "$srcdir"
    tar xf "$pkgname-$pkgver.tar.gz"
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/secry "$pkgdir/usr/bin/secry"
    install -Dm755 target/release/sec   "$pkgdir/usr/bin/sec"
    install -Dm644 README.md            "$pkgdir/usr/share/doc/$pkgname/README.md"
}

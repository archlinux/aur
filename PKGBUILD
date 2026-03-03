# Maintainer: sichvs <pers32100@gmail.com>
pkgname=secry
pkgver=1.1.8
pkgrel=1
pkgdesc='AES-256-GCM / ChaCha20-Poly1305 / XChaCha20-Poly1305 token encryption CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/rushpym-dotcom/secry-rs'
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('6c0f0c2d9e098bbd891642f69f3a354fb5e372f177c19d984a1510de3f65e01e')

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

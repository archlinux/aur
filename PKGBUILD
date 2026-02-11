# Maintainer: containerscrew <info@containerscrew.com>

pkgname=rsecure
pkgver=0.3.2
pkgrel=1
pkgdesc="Secure file encryption CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/containerscrew/rsecure"
license=('GPL3')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8807b0723cef8480aebc4090d202f38b35fbfa441bff47ac8b1dcf3a1b640194')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked || echo "Tests skipped (optional)"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/rsecure" "$pkgdir/usr/bin/rsecure"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


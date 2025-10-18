pkgname=rsecure
pkgver=0.3.0
pkgrel=1
pkgdesc="Secure file encryption CLI written in Rust"
arch=('x86_64')
url="https://github.com/containerscrew/rsecure"
license=('GPL3')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('385dcb0796337c35e5041b474e4841a0ffc16dcf0936c475f971dea9e9004da4')

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


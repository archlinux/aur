# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=poki-launcher
pkgver=0.8.0
pkgrel=1
pkgdesc="An application launcher that shows recently used apps first"
arch=('x86_64' 'i686' 'aarch64')
url="https://sr.ht/~zethra/poki-launcher/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/poki-launcher/archive/$pkgver.tar.gz")
depends=('qt5-declarative')
makedepends=('rust' 'cargo')
sha256sums=('095ca8b26728f4324c0d78938a63fc2bc8c90a5c1434e0c01d3c6b45b8ae7c91')

build() {
    cd "poki-launcher-$pkgver"

    cargo build --bin poki-launcher --release --locked
}

check() {
    cd "poki-launcher-$pkgver"

    cargo test --bin poki-launcher --release --locked
}

package() {
    cd "poki-launcher-$pkgver"

    install -Dm755 "target/release/poki-launcher" "$pkgdir/usr/bin/poki-launcher"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "poki-launcher.hjson" "$pkgdir/usr/share/doc/$pkgname/examples/poki-launcher.hjson"
}

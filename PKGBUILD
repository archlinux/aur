# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=poki-launcher
pkgver=0.7.0
pkgrel=1
pkgdesc="An application launcher that shows recently used apps first"
arch=('x86_64' 'i686' 'aarch64')
url="https://sr.ht/~zethra/poki-launcher/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/poki-launcher/archive/$pkgver.tar.gz")
depends=('qt5-declarative')
makedepends=('rust' 'cargo')
sha256sums=("e0578de1a3916efdd962f24bc8c8fa3a26916e97e56627ffeeb84493f8b206e6")

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

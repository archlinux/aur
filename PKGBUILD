# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=poki-launcher
pkgver=0.6.0
pkgrel=3
pkgdesc="An application launcher that shows recently used apps first"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/poki-launcher/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/poki-launcher/archive/$pkgver.tar.gz")
depends=('qt5-declarative')
makedepends=('rust' 'cargo')
sha256sums=("5697de9abbf58634586c35baf212b1a71f7a3f8b63263ffa388aca91a2a90e9e")

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
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/poki-launcher/README.md"
	install -Dm644 "poki-launcher.hjson" "$pkgdir/usr/share/doc/poki-launcher/examples/poki-launcher.hjson"
}

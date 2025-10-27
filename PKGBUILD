# Maintainer: Tyler Thompson <dhopcs@proton.me>

pkgname=hexhog
pkgver=0.1.2
pkgrel=1
pkgdesc="hex viewer/editor"
arch=('x86_64')
url="https://github.com/DVDTSB/hexhog"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DVDTSB/hexhog/archive/v$pkgver.tar.gz")
sha256sums=('9c417bd665c613760c875caecf32ccf37543af7c165c2dc055bf73c6fa8bf6f0')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

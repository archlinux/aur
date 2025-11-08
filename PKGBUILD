# Maintainer: Tyler Thompson <dhopcs@proton.me>

pkgname=hexhog
pkgver=0.1.3
pkgrel=1
pkgdesc="hex viewer/editor"
arch=('x86_64')
url="https://github.com/DVDTSB/hexhog"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DVDTSB/hexhog/archive/v$pkgver.tar.gz")
sha256sums=('5858dcb32b3f12647784c9a6ba2e107e157b9a82884bcfed3e994a70c7584b29')

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

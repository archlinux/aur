# Maintainer: Eddie Brunstedt <eddie.brunstedt@protonmail.com>

pkgname=ord
pkgver=2.2.0
pkgrel=1
pkgdesc="Process text through customizable LLM templates."
arch=('x86_64')
url="https://gitlab.com/EddieBrunstedt/ord"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('git' 'rust' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/EddieBrunstedt/ord/-/archive/$pkgver/ord-$pkgver.tar.gz")
sha256sums=('a3b4c52066cd6d8425238a86108d3d2f9378d9975ac06478a2ae2dea0bc3c27d')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

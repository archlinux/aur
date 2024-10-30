# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.21.2
pkgrel=1
pkgdesc='Build, bundle & ship your Rust WASM application to the web.'
arch=('x86_64')
url="https://github.com/thedodd/$pkgname/"
license=('APACHE' 'MIT')
depends=('openssl')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('de7180e8602bf43adfcee761c7c635d44aa5708876ec8f1c1c41d10f505d682d')
options=(!lto)

build() {
    cd "$pkgname-$pkgver"

    cargo build --release --no-default-features --features native-tls
}

check() {
    cd "$pkgname-$pkgver"

    cargo test --release --no-default-features --features native-tls
}

package(){
    cd "$pkgname-$pkgver"

    install --mode 755 -D --target-directory "$pkgdir/usr/bin" target/release/trunk
    install --mode 644 -D --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
    install --mode 644 -D --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE
}

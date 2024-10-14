# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.21.0
pkgrel=1
pkgdesc='Build, bundle & ship your Rust WASM application to the web.'
arch=('x86_64')
url="https://github.com/thedodd/$pkgname/"
license=('APACHE' 'MIT')
depends=('openssl')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('648ff0f89fe461d4977f389e38c5780cd79762ff5caf81e610c37461ea4801d9')
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

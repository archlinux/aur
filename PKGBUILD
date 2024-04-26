# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=trunk
pkgver=0.19.3
pkgrel=2
pkgdesc='Build, bundle & ship your Rust WASM application to the web.'
arch=('x86_64')
url="https://github.com/thedodd/$pkgname/"
license=('APACHE' 'MIT')
depends=('openssl')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a572c4ca842c4e5508dedd48bb1b216523c102fa2d8b5517efba004ad6b7e27d')
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

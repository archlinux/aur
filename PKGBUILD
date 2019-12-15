# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=simple-http-server
pkgver=0.4.7
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=('openssl-1.0')
makedepends=('cargo')
options=()
source=("https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha384sums=('00479097e8fa191a4e6ec41b762fde7f5e8ac956a1391f2ea30dcea51b134d9e22a520f810ff72222f7a9033a77e0467')

build() {
    export OPENSSL_LIB_DIR="/usr/lib/openssl-1.0"
    export OPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0"
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --out-dir target/release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

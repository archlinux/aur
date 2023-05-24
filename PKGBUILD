# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=geoip-http
pkgver=0.1.0
pkgrel=1
pkgdesc="GeoIP lookup server over HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/cdown/geoip-http"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f1fc14b2757f61be20d79bb748d8533d4c8b06294fbc55924cadbfe775f92045')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

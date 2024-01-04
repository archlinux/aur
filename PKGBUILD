# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=tesla_auth
pkgver=0.9.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tesla token generator"
url="https://github.com/adriankumpf/tesla_auth"
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
depends=('webkit2gtk-4.1' 'xdotool')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('88587285bce793342865eb23ad128a7a88d8cf575281af4e87c772ffb283db34')
provides=('tesla_auth')
conflicts=('tesla_auth')


prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --offline
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m755 "target/release/tesla_auth" "$pkgdir/usr/bin/tesla_auth"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

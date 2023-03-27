# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mullvad-ping
pkgver=0.4.0
pkgrel=1
pkgdesc="Gets the list of Mullvad servers with the best latency according to ping"
arch=('x86_64' 'aarch64')
url="https://github.com/grant0417/mullvad-ping"
license=('MIT')
depends=('gcc-libs')
makedepends=('deno' 'unzip')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3cf567fec78238cbae805ebc319e2e9023fbca4ddb56329778bde736ec53c26')

build() {
  cd "$pkgname-$pkgver"
  deno compile \
    --allow-net \
    --allow-run \
    --target ${CARCH}-unknown-linux-gnu \
    -o "$pkgname" script.ts
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

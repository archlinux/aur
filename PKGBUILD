# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-ping
pkgver=0.3.2
pkgrel=1
pkgdesc="Gets the list of Mullvad servers with the best latency according to ping"
arch=('x86_64' 'aarch64')
url="https://github.com/grant0417/mullvad-ping"
license=('MIT')
depends=('gcc-libs')
makedepends=('deno' 'unzip')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f25ebaf1550c3096e333aa1c2fe0802894210e736a1aeb4af769ce6ae9a7b41')

build() {
  cd "$pkgname-$pkgver"
  deno compile --allow-net --allow-run --target ${CARCH}-unknown-linux-gnu -o "$pkgname" script.ts
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

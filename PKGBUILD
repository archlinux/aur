# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mullvad-ping
pkgver=0.9.5
pkgrel=1
pkgdesc="Gets the list of Mullvad servers with the best latency according to ping"
arch=('x86_64' 'aarch64')
url="https://github.com/grant0417/mullvad-ping"
license=('MIT')
depends=(
  'gcc-libs'
  'iputils'
)
makedepends=(
  'deno'
  'unzip'
)
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6d7f8d3eadd88e5360e58847f1f2950c4a6488b126c49baa2407e2e3ad9e448')

build() {
  cd "$pkgname-$pkgver"
  deno compile \
    --allow-net=api.mullvad.net,jsr.io \
    --allow-run=ping \
    --target ${CARCH}-unknown-linux-gnu \
    -o "$pkgname" script.ts
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

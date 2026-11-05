# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=xgrep-search-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Ultra-fast indexed code search engine with MCP server for AI coding tools"
arch=('x86_64' 'aarch64')
url="https://github.com/momokun7/xgrep"
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc')
provides=('xgrep-search')
conflicts=('xgrep-search')
options=('!debug')
source_x86_64=("xg-$pkgver-x86_64.tar.gz::https://github.com/momokun7/xgrep/releases/download/v$pkgver/xg-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9fe13e5b6ff41115a2c2ef16cab23812e4fec377df7a3aca0e87663dec89051b')
sha256sums_aarch64=('2ba3f0942aa8a08419716b458708cdd25f651146ec5a3b8d985160ce5dd691e4')

source_aarch64=("xg-$pkgver-aarch64.tar.gz::https://github.com/momokun7/xgrep/releases/download/v$pkgver/xg-aarch64-unknown-linux-gnu.tar.gz")

package() {
  install -Dm755 xg "$pkgdir/usr/bin/xg"
  # Only MIT is installed: Apache-2.0's text ships in /usr/share/licenses/spdx.
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

latestver() {
  curl -fsSLI -o /dev/null -w '%{url_effective}\n' \
    'https://github.com/momokun7/xgrep/releases/latest' |
    sed -nE 's|.*/tag/v([0-9]+(\.[0-9]+)*)$|\1|p'
}

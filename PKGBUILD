# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=xgrep-search-bin
pkgver=0.8.3
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
sha256sums_x86_64=('97fb88eafd4c9d8c8eaf480bc9ff649be029f708ae3c7b280db92bd928c329e8')
sha256sums_aarch64=('ed714069e3a92b514de64062f85707715fbc3b9c6051ac72bca16a6741dd5953')

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

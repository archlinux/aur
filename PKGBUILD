# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=xgrep-search-bin
pkgver=0.8.2
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
sha256sums_x86_64=('e10421a6e9c873e764df3c04003e76afbe02d84a642efa7fe78aef748e505566')

source_aarch64=("xg-$pkgver-aarch64.tar.gz::https://github.com/momokun7/xgrep/releases/download/v$pkgver/xg-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('76c6c7d5f66d0069d9eb6eacb304bb9b31f1f11f82563a05c7e105d8c40fe14a')

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

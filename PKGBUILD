# Maintainer: Chris Werner Rau <aur@cwrau.io>

pkgname=capi-shell-mcp
pkgver=3.0.2 # renovate: datasource=github-releases depName=cwrau/capi-shell-mcp
pkgrel=1
pkgdesc="MCP provider for capi-shell — exec into cluster-api workload clusters"
url="https://github.com/cwrau/$pkgname"
arch=('x86_64' 'aarch64')
license=('MIT')
install="$pkgname.install"
provides=('capo-shell-mcp')
conflicts=('capo-shell-mcp')
replaces=('capo-shell-mcp')
# CI cross-builds a static Go binary per-arch and bundles it with LICENSE
# and the systemd units into a per-arch release asset -- no separate
# source archive needed.
source_x86_64=("$pkgname-linux-amd64.tar.gz::$url/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_aarch64=("$pkgname-linux-arm64.tar.gz::$url/releases/download/v$pkgver/$pkgname-linux-arm64.tar.gz")
sha256sums_x86_64=('904917d0dbaada5e7889b0fc6a91c4a67dd440284c9ed6a14d2e8931b2473144')
sha256sums_aarch64=('9f2d35ea8d3edfde07b6abe714eafadf984eb155c5a8827dd8ef154fd56620e6')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/lib/systemd/user"
  install -m644 "$srcdir/$pkgname.service" "$srcdir/$pkgname-config.path" \
    "$srcdir/$pkgname-config.service" "$pkgdir/usr/lib/systemd/user/"
}

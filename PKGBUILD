# Maintainer: Chris Werner Rau <aur@cwrau.io>

pkgname=capi-shell-mcp
pkgver=2.0.0 # renovate: datasource=github-releases depName=cwrau/capi-shell-mcp
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
sha256sums_x86_64=('2683dd4e381ee086a0d4570cbc681684bf4bac09a750cf9693943bf2d79fccce')
sha256sums_aarch64=('56932533abb4e6532269522cd341477866e937b1586ab2491825232e8df7f5d9')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/lib/systemd/user"
  install -m644 "$srcdir/$pkgname.service" "$srcdir/$pkgname-config.path" \
    "$srcdir/$pkgname-config.service" "$pkgdir/usr/lib/systemd/user/"
}

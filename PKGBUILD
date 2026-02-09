# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=annas-mcp
pkgver=0.0.4
pkgrel=2
pkgdesc="MCP server and CLI tool for searching and downloading documents from Anna's Archive"
arch=('x86_64' 'aarch64')
url="https://github.com/iosifache/annas-mcp"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/iosifache/annas-mcp.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/annas-mcp
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

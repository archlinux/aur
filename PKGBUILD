# Maintainer: LIghtJUNction
pkgname=humen-mcp-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Human-in-the-loop MCP server'
arch=('x86_64')
url='https://github.com/LIghtJUNction/humen-mcp'
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('humen-mcp')
conflicts=('humen-mcp' 'humen-mcp-git')
backup=('etc/humen-mcp.env')
install=humen-mcp.install
source=("https://github.com/LIghtJUNction/humen-mcp/releases/download/v${pkgver}/humen-mcp-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('6a61fd4f3325e851d97efff96593938e0d2b7ddae50dbc1f485320fda5aac7e0')

package() {
  cd "humen-mcp-${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 humen-mcp "$pkgdir/usr/bin/humen-mcp"
  install -Dm644 packaging/systemd/humen-mcp.service "$pkgdir/usr/lib/systemd/system/humen-mcp.service"
  install -Dm644 packaging/sysusers/humen-mcp.conf "$pkgdir/usr/lib/sysusers.d/humen-mcp.conf"
  install -Dm644 packaging/tmpfiles/humen-mcp.conf "$pkgdir/usr/lib/tmpfiles.d/humen-mcp.conf"
  install -Dm640 env.example "$pkgdir/etc/humen-mcp.env"
  install -dm755 "$pkgdir/usr/share/humen-mcp/web"
  cp -a web/. "$pkgdir/usr/share/humen-mcp/web/"
}

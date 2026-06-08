# Maintainer: LIghtJUNction
pkgname=humen-mcp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Human-in-the-loop MCP server'
arch=('x86_64')
url='https://github.com/LIghtJUNction/humen-mcp'
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('humen-mcp')
conflicts=('humen-mcp' 'humen-mcp-git')
backup=('etc/humen-mcp.env')
source=("https://github.com/LIghtJUNction/humen-mcp/releases/download/v${pkgver}/humen-mcp-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e2be3ff068ad9b8ad5d11d8c56266e90c58a8e99489d18cd63147a3df484e657')

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


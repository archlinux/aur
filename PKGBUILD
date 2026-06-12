# Maintainer: LIghtJUNction
pkgname=humen-mcp-bin
pkgver=0.1.13
pkgrel=1
pkgdesc='Human-in-the-loop MCP server'
arch=('x86_64')
url='https://github.com/LIghtJUNction/humen-mcp'
license=('MIT')
depends=('gcc-libs' 'openssl' 'sudo')
provides=('humen-mcp')
conflicts=('humen-mcp' 'humen-mcp-git')
backup=('etc/humen-mcp.env')
install=humen-mcp.install
source=("https://github.com/LIghtJUNction/humen-mcp/releases/download/v${pkgver}/humen-mcp-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('225a9aa4d773c63371af960bdef57883446c1f91216135753bb61d5783356e86')

package() {
  cd "humen-mcp-${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 humen-mcp "$pkgdir/usr/bin/humen-mcp"
  install -Dm644 packaging/systemd/humen-mcp.service "$pkgdir/usr/lib/systemd/system/humen-mcp.service"
  install -Dm644 packaging/systemd/humen-mcp-self-update.service "$pkgdir/usr/lib/systemd/system/humen-mcp-self-update.service"
  install -Dm755 packaging/scripts/humen-mcp-self-update "$pkgdir/usr/lib/humen-mcp/humen-mcp-self-update"
  install -Dm440 packaging/sudoers/humen-mcp-self-update "$pkgdir/etc/sudoers.d/humen-mcp-self-update"
  install -Dm644 packaging/sysusers/humen-mcp.conf "$pkgdir/usr/lib/sysusers.d/humen-mcp.conf"
  install -Dm644 packaging/tmpfiles/humen-mcp.conf "$pkgdir/usr/lib/tmpfiles.d/humen-mcp.conf"
  install -Dm640 env.example "$pkgdir/etc/humen-mcp.env"
  install -dm755 "$pkgdir/usr/share/humen-mcp/web"
  cp -a --no-preserve=ownership web/. "$pkgdir/usr/share/humen-mcp/web/"
}

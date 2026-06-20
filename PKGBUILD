# Maintainer: LIghtJUNction
pkgname=human-mcp-bin
pkgver=0.1.21
pkgrel=1
pkgdesc='Human-in-the-loop MCP server'
arch=('x86_64')
url='https://github.com/LIghtJUNction/human-mcp'
license=('MIT')
depends=('gcc-libs' 'openssl' 'sudo')
provides=('human-mcp')
conflicts=('human-mcp' 'human-mcp-git')
backup=('etc/human-mcp.env')
install=human-mcp.install
source=("https://github.com/LIghtJUNction/human-mcp/releases/download/v${pkgver}/human-mcp-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b62b4340b82618412d96f1dfb973882747fb3c76551ceca77ee3b63f2c7f96ad')

package() {
  cd "human-mcp-${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 human-mcp "$pkgdir/usr/bin/human-mcp"
  install -Dm644 packaging/systemd/human-mcp.service "$pkgdir/usr/lib/systemd/system/human-mcp.service"
  install -Dm644 packaging/systemd/human-mcp-self-update.service "$pkgdir/usr/lib/systemd/system/human-mcp-self-update.service"
  install -Dm755 packaging/scripts/human-mcp-self-update "$pkgdir/usr/lib/human-mcp/human-mcp-self-update"
  install -Dm440 packaging/sudoers/human-mcp-self-update "$pkgdir/etc/sudoers.d/human-mcp-self-update"
  install -Dm644 packaging/sysusers/human-mcp.conf "$pkgdir/usr/lib/sysusers.d/human-mcp.conf"
  install -Dm644 packaging/tmpfiles/human-mcp.conf "$pkgdir/usr/lib/tmpfiles.d/human-mcp.conf"
  install -Dm640 env.example "$pkgdir/etc/human-mcp.env"
  install -dm755 "$pkgdir/usr/share/human-mcp/web"
  cp -a --no-preserve=ownership web/. "$pkgdir/usr/share/human-mcp/web/"
}

# Maintainer: Jason Landbridge & mcpproxy

pkgname=mcpproxy-bin
pkgver=0.29.2 # renovate: datasource=github-tags depName=smart-mcp-proxy/mcpproxy-go
pkgrel=8
pkgdesc="Smart proxy for AI agents using the Model Context Protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/smart-mcp-proxy/mcpproxy-go"
license=('MIT')
install="$pkgname.install"
optdepends=('systemd: run the bundled systemd user service with systemctl --user')
provides=('mcpproxy')
conflicts=('mcpproxy')
options=('!strip')
source_x86_64=(
  "mcpproxy-${pkgver}-linux-amd64.tar.gz::https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v${pkgver}/mcpproxy-${pkgver}-linux-amd64.tar.gz"
)
source_aarch64=(
  "mcpproxy-${pkgver}-linux-arm64.tar.gz::https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v${pkgver}/mcpproxy-${pkgver}-linux-arm64.tar.gz"
)
source=(
  "mcp_config.json.example::https://raw.githubusercontent.com/smart-mcp-proxy/mcpproxy-go/v${pkgver}/packaging/linux/mcp_config.json.example"
  "LICENSE::https://raw.githubusercontent.com/smart-mcp-proxy/mcpproxy-go/v${pkgver}/LICENSE"
  "$pkgname.install"
  "mcpproxy.service"
)
sha256sums=('f07d24f77cf4e69feec20282ff443fe1f83607495b1d03d0306342b00ddb1a61'
            '897cd80d344a5570fcd3526834fffdb0b9bd8087632455dd393f5f2d43c94d47'
            '47220bfb076e34a1d349307679b7d4707fbe1426f1355049e69bced26568fea0'
            '90e257e7ed1be526356a57110e99c6d04039ff80b4b0e426bb8e8898cf657551')
sha256sums_x86_64=('f0ea6e942617a5774c4767f71a56f25c5dc35180381952621aa19c4e4ca7c867')
sha256sums_aarch64=('4c1f7cc48170b61252115b379cd4f5725082fccff9b1b154e88ad190be89012a')

package() {
  install -Dm755 "$srcdir/mcpproxy" \
    "$pkgdir/usr/bin/mcpproxy"

  install -Dm644 "$srcdir/mcpproxy.service" \
    "$pkgdir/usr/lib/systemd/user/mcpproxy.service"

  install -Dm644 "$srcdir/mcp_config.json.example" \
    "$pkgdir/usr/share/doc/$pkgname/mcp_config.json.example"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

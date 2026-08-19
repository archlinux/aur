# Maintainer: Jason Landbridge & mcpproxy
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/mcpproxy-bin

pkgname=mcpproxy-bin
pkgver=0.57.0 # renovate: datasource=github-tags depName=smart-mcp-proxy/mcpproxy-go versioning=semver-coerced extractVersion=^v?(?<version>.*)$
pkgrel=1
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
            '0dbb8e1a0431cffe8d739fee40f73e237ed9be37887e285d7524d1a02afa1ce4')
sha256sums_x86_64=('1deaee1ab7bfd9842901c4feee33d3d32b24bfa49efc79f9ef9454d1bf1748d4')
sha256sums_aarch64=('d690aa15356d6769417faf810f981b5165fd2ad46e0333e8309e802b74063bfd')

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

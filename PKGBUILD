# Maintainer: Jason Landbridge & mcpproxy
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/mcpproxy-bin

pkgname=mcpproxy-bin
pkgver=0.55.0 # renovate: datasource=github-tags depName=smart-mcp-proxy/mcpproxy-go versioning=semver-coerced extractVersion=^v?(?<version>.*)$
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
sha256sums_x86_64=('420762173ba2714c18bb3840d115639fbd850fe92a093db53c1e24fdf5927d40')
sha256sums_aarch64=('a08e4c4745355faf0c17b71f38e91d8191dde26143bf2d9c2da9052242c1dc6b')

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

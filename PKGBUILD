# Maintainer: James Hughes <james@pyrosoftsolutions.co.uk>
pkgname=sudo-mcp
pkgver=0.5.1
pkgrel=1
pkgdesc="⚠️ INHERENTLY UNSAFE: MCP server allowing AI models to execute privileged commands via sudo/pkexec"
arch=('x86_64' 'aarch64')
url="https://github.com/hughesjs/sudo-mcp"
license=('MIT')
depends=('polkit' 'sudo')
options=('!strip')  # .NET single-file bundles are destroyed by strip
source_x86_64=("${pkgname}-${pkgver}-x64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-x64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('fa19430442304e84e91fd6e1ff065bdf08c5779e21cc0b4595a39f0b1c46b57f')
sha256sums_aarch64=('64544afee8e661015d032af7e2c06b34a24cd630cc28e6f1128c344e015f5f47')

package() {
    case "$CARCH" in
        x86_64)
            cd "sudo-mcp-x64-v${pkgver}"
            ;;
        aarch64)
            cd "sudo-mcp-arm64-v${pkgver}"
            ;;
    esac

    # Install binary
    install -Dm755 sudo-mcp "$pkgdir/usr/bin/sudo-mcp"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create log directory
    install -dm755 "$pkgdir/var/log/sudo-mcp"
}

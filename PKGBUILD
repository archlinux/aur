# Maintainer: James Hughes <james@pyrosoftsolutions.co.uk>
pkgname=sudo-mcp
pkgver=0.3.6
pkgrel=1
pkgdesc="⚠️ INHERENTLY UNSAFE: MCP server allowing AI models to execute privileged commands via sudo/pkexec"
arch=('x86_64' 'aarch64')
url="https://github.com/hughesjs/sudo-mcp"
license=('MIT')
depends=('polkit' 'sudo')
options=('!strip')  # .NET single-file bundles are destroyed by strip
source_x86_64=("${pkgname}-${pkgver}-x64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-x64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('74ad3a4c37c613a76f371761b7bc0a6113815a89960905815319739d07ec1484')
sha256sums_aarch64=('dda66a0617bed8952b04607c2d67e8b367e9814b6d342a7912fc90e71b06ef00')

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

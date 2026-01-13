# Maintainer: James Hughes <james@pyrosoftsolutions.co.uk>
pkgname=sudo-mcp
pkgver=0.3.2
pkgrel=1
pkgdesc="⚠️ INHERENTLY UNSAFE: MCP server allowing AI models to execute privileged commands via sudo/pkexec"
arch=('x86_64' 'aarch64')
url="https://github.com/hughesjs/sudo-mcp"
license=('MIT')
depends=('polkit' 'sudo')
options=('!strip')  # .NET single-file bundles are destroyed by strip
source_x86_64=("${pkgname}-${pkgver}-x64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-x64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('3ca04797145db201a2e9d5f9d1e2e1dda5195b174e9ed5b00eebf921121d1695')
sha256sums_aarch64=('838a55f3c34a8be4c9e4f8a1be907007c8b180a91a16dea651a87e3a87fb49e7')

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

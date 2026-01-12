# Maintainer: James Hughes <james@pyrosoftsolutions.co.uk>
pkgname=sudo-mcp
pkgver=0.2.0
pkgrel=1
pkgdesc="MCP server for privileged command execution via sudo/pkexec"
arch=('x86_64' 'aarch64')
url="https://github.com/hughesjs/sudo-mcp"
license=('MIT')
depends=('polkit' 'sudo')
options=('!strip')  # .NET single-file bundles are destroyed by strip
source_x86_64=("${pkgname}-${pkgver}-x64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-x64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/hughesjs/sudo-mcp/releases/download/v${pkgver}/sudo-mcp-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('03a98cb01acf69e645a97b1bc22b2a565929daef3aaa301e001c441243a12517')
sha256sums_aarch64=('80af3303af040f9a6bfd3afe9d452f26e2bffda213137371cbe59dab7a28b14b')

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
    install -Dm755 sudo-mcp "$pkgdir/usr/local/bin/sudo-mcp"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create log directory
    install -dm755 "$pkgdir/var/log/sudo-mcp"
}

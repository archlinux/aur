# Maintainer: Add your name and email before submitting to the AUR
# Release metadata: https://github.com/agentclientprotocol/registry/blob/main/antigravity-acp/agent.json

pkgname=antigravity-acp-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Official standalone Google Antigravity Agent Client Protocol (ACP) server'
arch=('x86_64' 'aarch64')
url='https://antigravity.google/docs/ide/extensions/acp'
license=('custom:proprietary')
depends=('glibc' 'gcc-libs')
provides=('antigravity-acp')
conflicts=('antigravity-acp')
options=('!strip' '!debug')

source=('LICENSE' 'antigravity-acp')
sha256sums=('ddba908629d9685f434b27342d2747d0d8a69e270517e56e4dd7b65bf2edaa93'
            '7c828934a34651521f3663035f114e5ec65075be7fa9101e880a633c117d45ae')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://dl.google.com/agy-extensions/releases/linux/agy-acp-server-${pkgver}-linux-x86_64.zip")
sha256sums_x86_64=('36f373e8948edf1727b39c7d62b5722d6a4474bdfd72b04ad3d6def571808c9f')

source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://dl.google.com/agy-extensions/releases/linux/agy-acp-server-${pkgver}-linux-arm64.zip")
sha256sums_aarch64=('1e184f439477b54138e94440056b26a78c0a8075a8fd2ffda637ec31267c6459')

package() {
    # Both upstream files must stay together for the ACP server to work.
    install -Dm755 "${srcdir}/agy_acp_server.par" \
        "${pkgdir}/opt/antigravity-acp/agy_acp_server.par"
    install -Dm755 "${srcdir}/localharness_external" \
        "${pkgdir}/opt/antigravity-acp/localharness_external"

    # Runs the official ACP pair with its required --uid= argument.
    install -Dm755 "${srcdir}/antigravity-acp" \
        "${pkgdir}/usr/bin/antigravity-acp"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

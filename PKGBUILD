# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.27.2
pkgrel=1
pkgdesc="Fast browser automation CLI for AI agents (native binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
provides=('agent-browser')
conflicts=('agent-browser')
optdepends=(
    'chromium: Default browser engine (recommended)'
    'google-chrome: Alternative browser engine'
    'lightpanda: Alternative browser engine optimized for AI'
    'appium: For iOS Simulator support (--provider ios)'
)
source=("agent-browser-${pkgver}.tar.gz::https://github.com/vercel-labs/agent-browser/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-arm64")

sha256sums=('d2462a95626a2b5ec191a4c28ca68883aa91c7aa181730905ad4eb62ee0aae30')
sha256sums_x86_64=('cfc158bf92ea92780c67909777739ed47c25d8ad2f0161de5ef85e0d545d92fc')
sha256sums_aarch64=('3350efa628cd24b6a93228269daf71acd23c355ee04373c5c13d372ae0d5a936')

package() {
    cd "agent-browser-${pkgver}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/lib/agent-browser/bin/agent-browser"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/agent-browser/bin/agent-browser "${pkgdir}/usr/bin/agent-browser"
    cp -r skills skill-data "${pkgdir}/usr/lib/agent-browser/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

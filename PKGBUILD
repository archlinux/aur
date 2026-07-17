# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.32.2
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

sha256sums=('d653eb438195fa0c8107cb8f253be351a081558e020d933a24756328a790f610')
sha256sums_x86_64=('666a11292ff1afb281c023212f6620b97f81026cbb498e314dcfaf67e0a929c9')
sha256sums_aarch64=('bcc24fca07f12792e31f16cb4fbb38893ebdd9cbbe944631439b2a561d725fbc')

package() {
    cd "agent-browser-${pkgver}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/lib/agent-browser/bin/agent-browser"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/agent-browser/bin/agent-browser "${pkgdir}/usr/bin/agent-browser"
    cp -r skills skill-data "${pkgdir}/usr/lib/agent-browser/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

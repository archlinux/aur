# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.35.0
pkgrel=1
pkgdesc="Fast browser automation CLI for AI agents (native binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('glibc')
provides=('agent-browser')
conflicts=('agent-browser')
optdepends=(
    'chromium: Default browser engine (recommended)'
    'google-chrome: Alternative browser engine'
    'lightpanda: Alternative browser engine optimized for AI'
    'appium: For iOS Simulator support (--provider ios)'
    'nss: Private proxy CA trust support (--ca-cert)'
)
source=("agent-browser-${pkgver}.tar.gz::https://github.com/vercel-labs/agent-browser/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-arm64")

sha256sums=('ea4331fae4ddbc1d787908011347234d5ddb88ec920dec7c7240801a9687d04a')
sha256sums_x86_64=('b7a28c3a43a7008dd02585e2e60c391c08983f7a099149caed63c9f13f57b752')
sha256sums_aarch64=('92cd7d0897837ac648b9a6ab1965c69c5920e0f54df57e4295cdb1143b0541c8')

package() {
    cd "agent-browser-${pkgver}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/lib/agent-browser/bin/agent-browser"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/agent-browser/bin/agent-browser "${pkgdir}/usr/bin/agent-browser"
    cp -r skills skill-data "${pkgdir}/usr/lib/agent-browser/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 cli/src/native/a11y/LICENSE-axe-core.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-axe-core"
    install -Dm644 cli/src/native/a11y/LICENSE-axe-core-THIRD-PARTY.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-axe-core-THIRD-PARTY"
}

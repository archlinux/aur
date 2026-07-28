# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.33.1
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
)
source=("agent-browser-${pkgver}.tar.gz::https://github.com/vercel-labs/agent-browser/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-arm64")

sha256sums=('313e7706485c246b818a2138dabc6f8784f91bfa25cae7db445e6ca14c730022')
sha256sums_x86_64=('6e04d06605c4ca62da36e3263086e0f7ceae808b55508de2c3958d4b7fe430aa')
sha256sums_aarch64=('281cce8e3e9eb11fd823b13c085996d7361c35923ad454ce5cb06a5515630e9b')

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

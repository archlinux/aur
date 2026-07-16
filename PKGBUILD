# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.32.0
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

sha256sums=('e6b6fb67313130f414498518b3698d28c08c95d25bc79bc84e0e843402305ab1')
sha256sums_x86_64=('c8dd1344a0bdae8ebf76833a99eabe60afb0bfbd7f5e1dcdb589588e47f97c72')
sha256sums_aarch64=('f3a4e48afcab95eada89c72c2004e98321ee74a896578d73e963d3131bd9531c')

package() {
    cd "agent-browser-${pkgver}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/lib/agent-browser/bin/agent-browser"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/agent-browser/bin/agent-browser "${pkgdir}/usr/bin/agent-browser"
    cp -r skills skill-data "${pkgdir}/usr/lib/agent-browser/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

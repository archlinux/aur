# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.41.0
pkgrel=1
_commit=1453dd37a40c730fe00f592bc32198a896ff8747
pkgdesc="Fast browser automation CLI for AI agents (native binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('bash' 'glibc')
provides=("agent-browser=$pkgver")
conflicts=('agent-browser')
optdepends=(
    'chromium: Default browser engine (recommended)'
    'ffmpeg: Video recording support (record start)'
    'google-chrome: Alternative browser engine'
    'lightpanda: Alternative browser engine optimized for AI'
    'appium: For iOS Simulator support (--provider ios)'
    'nss: Private proxy CA trust support (--ca-cert)'
)
options=('!strip' '!debug')
source=("agent-browser-${pkgver}-${_commit}.tar.gz::https://github.com/vercel-labs/agent-browser/archive/${_commit}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-arm64")

sha256sums=('a700b2ca32c873e9369f2f82d5c9fcf8329e6b8b4ce8c6bed117808a2ee51dfa')
sha256sums_x86_64=('399c7e9f06bd29aa933fdf25c0bd958eea06927fc0ce6f536ba6347aabd64628')
sha256sums_aarch64=('e196e9cabe6cb1b01bd5912973628361b9f40a332683a12426abad007f0d3589')

package() {
    cd "agent-browser-${_commit}"
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

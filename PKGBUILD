# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.39.4
pkgrel=1
_commit=04ba5264dade678062c3cdcce0f4f293e748249f
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

sha256sums=('557fef43247eec52a32271c07756180816d76069429bd4f194556dd1e7ae3220')
sha256sums_x86_64=('aa82c8ee81a38b8ad9ba61af02ced6dcbbb8af36dd8b2b479384177f8aa077a6')
sha256sums_aarch64=('922b60dbd9f5c8b5c0f39b453bfe8cbf61b83abd487344028a508e8c4dca7883')

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

# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.43.0
pkgrel=1
_commit=1cc19526f3641c8543d55aa6700e7c55b37ac356
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

sha256sums=('26450a6ad06ecdd1cd5980247a580fd0e86f10d7b458cac8488ace43d12ee82e')
sha256sums_x86_64=('8e69c9fb662514c9cf36e4911e94e913742ba066e55102486350e049dd847612')
sha256sums_aarch64=('34be55c2b92d8d199fb9d1d62a905ee5b6ac5b1f3e8c24e5b20597f370d905e5')

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

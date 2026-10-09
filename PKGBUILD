# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=agent-browser-bin
pkgver=0.39.0
pkgrel=1
_commit=44af39842650f0bb9c1afb7354df9a82921d4f09
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

sha256sums=('4098d7e8cbcc816cbafeb6f36a7af7d7767e2ea9147f09a3f20ae071dae8b5e1')
sha256sums_x86_64=('d258593db4899577748a4b2a671a315f76f07a4553ba7fbbeaa95f0d16a4aaa8')
sha256sums_aarch64=('54eedbcaedcbd8b49f840098ea85dda653af0a036e28609b526ece068de6c0ab')

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

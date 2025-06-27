# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ai-infra-guard-bin
_pkgname=AI-Infra-Guard
pkgver=2.6
pkgrel=1
pkgdesc="AI infrastructure security assessment tool designed to discover and detect potential security risks in AI systems.(Written in Go,prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/Tencent/AI-Infra-Guard"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python'
    'python-requests'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('ca9c710df4e35c5aead2db94d8006b424643241ca43f12fa835ae6f927122031')
sha256sums_armv7h=('291e73004e7a2d57320689315631ab52f0895d585ac327b7a389714045d1aed8')
sha256sums_i686=('b617b6f685bc4d7027f3ef5c34536ae425e4691e60789d9121389da856b7dde5')
sha256sums_x86_64=('bec59a1897dddaf48e29d7d070e5cddb1c82da03a2e061960c104ca396e440da')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,mcp-testcase} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/doc/${pkgname}"
}

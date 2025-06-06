# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ai-infra-guard-bin
_pkgname=AI-Infra-Guard
pkgver=2.4.1
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
sha256sums_aarch64=('05cbadcbb250b5a4766e1bab6a09a151df1cbee6ed97322c8c05ab227e1e124d')
sha256sums_armv7h=('77b9aa4a66b8d3a9ab9bcbcbc182f61a0dcf929d98b8cd1746959f9bf4469f6c')
sha256sums_i686=('f4d9d891962fba70ffbaedb6a3e351c546e207bcd21c093673f97cb077c04ce4')
sha256sums_x86_64=('66010380d6000d4c1885c57166afcfd42ccd9b966a46d6560c558223bd12cb3b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,mcp-testcase} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/doc/${pkgname}"
}

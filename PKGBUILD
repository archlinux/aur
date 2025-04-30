# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ai-infra-guard-bin
_pkgname=AI-Infra-Guard
pkgver=2.1
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
sha256sums_aarch64=('6ab80c24314b8901a3e51c9b11d9b0638bd0ca186b63ac2f66eac7644f0fc950')
sha256sums_armv7h=('2874fbbc1721c9663de768a697d16d484bda60d8d74e73675bd860e1d08611f5')
sha256sums_i686=('ab0c8ecc294de44949b1b4f80c54f1f3c48fff6f4b85e60f81aa88c36d429b72')
sha256sums_x86_64=('88b3be257ffc01ca0e78a6e1eb47b1e8e1e7477fd1ec9c6130a8f9c0e5de8fe6')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,mcp-testcase} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/doc/${pkgname}"
}
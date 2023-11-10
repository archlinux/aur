# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lightrail-core-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="An open-source AI command bar that seeks to simplifies software development. It is designed to be a general-purpose, extensible platform for integrating LLM-based tooling into engineering/development workflows. "
arch=("x86_64")
url="https://lightrail.ai/"
_githuburl="https://github.com/lightrail-ai/lightrail"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron24'
    'python>=3'
    'python-setuptools'
)
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}.deb"
    "LICENSE::https://raw.githubusercontent.com/lightrail-ai/lightrail/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('455ec021575d3ab5c98ea44ce43893b9de3afdbc0b234bfa983ba09995fcb777'
            '979fa2f24e61dc088e74d67f0cb0f6db041ea88b1574c5a1ec1c71c8a083a2c3'
            'd061ac3a0647f4d3f43ead1b7bf34906b928197fa0847b29e5fbf25f491e0980')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-core-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-core-bin}/resources/"{app,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
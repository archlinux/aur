# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=discord-netflix
_pkgname=Discord-Netflix
pkgver=1.1.11
pkgrel=2
pkgdesc="An updated and improved version from the original Discord-Netflix from Nirewen."
arch=('any')
url="https://discord.gg/kbf8EjpxbU"
_githuburl="https://github.com/V0l-D/Discord-Netflix"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron21')
makedepends=('gendesk' 'nodejs>=7' 'npm' 'python>=3.9.0' 'git')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('0089ede7b55b408258b63104589717bf73393a6a09e9f85c782377f55ecfe50f'
            'c0f247e4fede012344c55ccbaad92eea1e2a20c68204368df2692dfcb8a40ba1')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run linbuild
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
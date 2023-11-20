# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=discord-netflix
_pkgname=Discord-Netflix
pkgver=1.1.12
pkgrel=1
pkgdesc="An updated and improved version from the original Discord-Netflix from Nirewen."
arch=('any')
url="https://discord.gg/kbf8EjpxbU"
_ghurl="https://github.com/V0l-D/Discord-Netflix"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'electron21'
)
makedepends=(
    'gendesk'
    'nodejs>=7'
    'npm'
    'python>=3.9.0'
    'git'
    'make'
    'gcc'
)
source=(
    "${pkgname}-${pkgver}.zip::${_ghurl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('c6b771f3c5c7e4553e8ff358072d08a1c176915719c87bf07730a4ae8554bd52'
            '1e12e2e00e789bd94f2a60d0b93594f05021e6c593f4f6befd64628eaa6212f9')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run linbuild
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
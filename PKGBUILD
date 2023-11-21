# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sharing-gui
_pkgname=sharing-GUI
_appname="Sharing GUI"
pkgver=1.4.0
pkgrel=2
pkgdesc="Easily share files to multiple devices on the LAN/Public Network."
arch=('x86_64')
url="https://sharing-gui.yuanx.me/"
_ghurl="https://github.com/imyuanx/sharing-GUI"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron21'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'yarn'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '1a813b485817e6ac4c969b71dd9efd732aee8c69f7713e3ed23bab36e6405036')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '54,57d' -i forge.config.js
    yarn install --cache-folder "${srcdir}/npm-cache"
    yarn package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/logo-512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

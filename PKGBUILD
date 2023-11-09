# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=refi-app-bin
_pkgname="Refi App"
pkgver=0.0.19
pkgrel=4
pkgdesc="A tool to make interacting with Firestore less painful"
arch=('x86_64')
url="https://refiapp.io/"
_githuburl="https://github.com/thanhlmm/refi-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libdrm'
    'gdk-pixbuf2'
    'gtk3'
    'mesa'
    'libdrm'
    'cairo'
    'expat'
    'libxrandr'
    'libxcb'
    'nspr'
    'libxext'
    'sh'
    'dbus'
    'nss'
    'at-spi2-core'
    'libx11'
    'libxkbcommon'
    'libxshmfence'
    'pango'
    'libcups'
    'alsa-lib'
    'libxdamage'
    'libxfixes'
    'libxcomposite'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/thanhlmm/refi-app/v${pkgver}/LICENSE"
)
sha256sums=('01918b95b8109d2c02b0a2b517a5f59f8f795b02a02557cfd420f80fbd345dc4'
            'b2eb77a849db152dcb5ed71c597000a5dc3638559aefae0b5aa3454e8d7abe71')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
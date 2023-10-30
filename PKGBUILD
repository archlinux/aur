# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=querym-bin
_pkgname=Querym
pkgver=0.5.8
pkgrel=1
pkgdesc="A free, open-source, and cross-platform GUI tool designed to make database management accessible and efficient."
arch=('x86_64')
url="https://querymaster.io"
_ghurl="https://github.com/querymx/querym"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    #'bash'
    #'electron23'
    'hicolor-icon-theme'
    'libcups'
    'nss'
    'nspr'
    'gtk3'
    'dbus'
    'libxfixes'
    'libxcomposite'
    'libdrm'
    'alsa-lib'
    'libxdamage'
    'expat'
    'pango'
    'libxext'
    'at-spi2-core'
    'libxrandr'
    'libx11'
    'libxcb'
    'cairo'
    'mesa'
    'libxkbcommon'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_amd64.deb"
    #"${pkgname%-bin}.sh"
)
sha256sums=('661af6049d8c06a326cda6df6d875e63e94562b9e7693f8ad6538d1eb98e472b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    #install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    #install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    #cp -r "${srcdir}/opt/${_pkgname}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
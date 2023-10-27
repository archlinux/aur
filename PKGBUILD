# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duskplayer-bin
_pkgname="DuskPlayer"
pkgver=7.0.0
pkgrel=1
pkgdesc="A minimalistic music player, designed for simplicity. "
arch=("x86_64")
url="https://github.com/Aveek-Saha/DuskPlayer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'libxi'
    'libxdamage'
    'glib2'
    'nspr'
    'libxext'
    'alsa-lib'
    'expat'
    'libxcursor'
    'hicolor-icon-theme'
    'libxtst'
    'libcups'
    'gtk3'
    'libx11'
    'dbus'
    'gdk-pixbuf2'
    'libxfixes'
    'libxcb'
    'libxss'
    'nss'
    'pango'
    'util-linux-libs'
    'cairo'
    'at-spi2-core'
    'libxcomposite'
    'libxrender'
    'libxrandr'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Aveek-Saha/DuskPlayer/v${pkgver}/LICENSE"
)
sha256sums=('4ac36192c1dccb4b33ba9483c6bd60fbc3f588509826e846ab5baaa1b43111ad'
            '634de9f3cc2e60e2040fb2162e8722d13ee3d863d9b5a1c65c3e08a6149bee1c')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin} --no-sandbox|g;s|Utility|AudioVideo|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
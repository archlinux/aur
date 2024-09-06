# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=unyo-bin
_pkgname=Unyo
pkgver=0.6.2
pkgrel=1
pkgdesc="🐙 Anime streaming and Manga reader desktop app without ads."
arch=("x86_64")
url="https://github.com/K3vinb5/Unyo"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('15e309059a994ed8be2317814629ab0e0f4e5e1985434b48693afd3c713eb522'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/usr/local/lib/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/local/lib/${pkgname%-bin}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/local/lib/${pkgname%-bin}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="droppoint-bin"
pkgver=1.2.1
pkgrel=4
pkgdesc="Make drag-and-drop easier using DropPoint. Drag content without having to open side-by-side windows"
arch=('x86_64')
url="https://droppoint.netlify.app/"
_githuburl="https://github.com/GameGodS3/DropPoint"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron13' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('b272d4415363eb33c54a6bec11aff870c51a1af4cf736ee76190bd4bd71ca5f4'
            'f865c95f0dfd821a9670bf5537d218662ebeedc8d5feacd90c26406ada796b71')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/DropPoint/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/DropPoint/droppoint %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
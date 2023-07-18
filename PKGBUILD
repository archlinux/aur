# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="p3x-onenote-bin"
pkgver=2023.10.187
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.corifeus.com/onenote/"
_githuburl="https://github.com/patrikx3/onenote"
license=('MIT')
depends=('hicolor-icon-theme' 'bash' 'electron24')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/patrikx3/onenote/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('65c457fc662ea5aeaf8911c9687f2fd1b076d6314e11511f8b9deddb07e637fc'
            'bd02a1e4594c9b781b1b3dfc9eb82981d8d2508b36cf631c6ef5f0a737c95222'
            '1a80871d5b9ccd1b5521eb1e62687f32c6002c37ae172d357bf4938bb4711576')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/P3X OneNote/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/P3X OneNote/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
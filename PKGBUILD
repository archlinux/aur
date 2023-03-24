# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nxshell
pkgname="${_pkgname}-appimage"
pkgver=1.9.3
pkgrel=1
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
license=('MIT')
options=(!strip)
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/NxShell-x86_64-linux-${pkgver}-202303220832.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('6824f48a9b3d453bc6ec660bc566d07defac8be9a60a7798a1f2122b4a16631d'
            '66cb6bb15c338de5a7aa8356fd76f3db92151ef80405bcfeb573b7d39f9333ce')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/nxshell.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
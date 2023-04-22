# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nxshell-appimage"
pkgver=1.9.3
pkgrel=2
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
providers=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/NxShell-x86_64-linux-${pkgver}-202303220832.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('6824f48a9b3d453bc6ec660bc566d07defac8be9a60a7798a1f2122b4a16631d'
            '66cb6bb15c338de5a7aa8356fd76f3db92151ef80405bcfeb573b7d39f9333ce')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/nxshell.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="polyglot-appimage"
pkgver=0.3.3
pkgrel=1
pkgdesc="基于ChatGPT和Azure人工智能语言模型作为底层服务，旨在提供一个易于使用的语言练习平台，方便进行多语种的口语练习"
arch=("x86_64")
url="https://polyglotai.xyz/"
_githuburl="https://github.com/liou666/polyglot"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Polyglot_${pkgver}.AppImage")
sha256sums=('cd360147b263e5937bab73e06b5916261e1d4aa04b761e407d8ea2ad219a3c5b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
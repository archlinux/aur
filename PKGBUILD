# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wolai-bin
_pkgname=wolai
pkgver=1.2.6
pkgrel=2
pkgdesc="wolai"
arch=("x86_64")
url="https://www.wolai.com/"
license=('Custom')
depends=(hicolor-icon-theme zlib)
provides=()
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::https://cdn.wostatic.cn/dist/installers/${_pkgname}-${pkgver}.AppImage")
_install_path="/opt/appimages"
sha256sums=('8e26a5be413d5cd9efe2bf5f37897d443fc6e7236e4ef2c1502ea69d59760013')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/\#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for i in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

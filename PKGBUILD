# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=weektodo-appimage
_pkgname=weektodo
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="WeekToDo is a Free and Open Source Weekly Planner. Stop prioritizing what's on your schedule and start scheduling your priorities."
arch=("x86_64")
url="https://weektodo.me/"
_githuburl="https://github.com/manuelernestog/weektodo"
license=(GPL3)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=(weektodo)
conflicts=(weektodo-bin)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/WeekToDo-${pkgver}.AppImage")
sha256sums=('bdbd5fab6dc80c18629119cd76ba6a1d506b9bf11ffab2a91a3eafd34c134b0b')
     
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/weektodo.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for i in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do 
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
}

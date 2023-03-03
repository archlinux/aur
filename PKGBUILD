# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tilde-podcast-appimage
_pkgname=tilde-podcast
pkgver=1.0.0
pkgrel=2
pkgdesc="Podcast client to listen to all you favorite podcasts"
arch=('x86_64')
url="https://github.com/paologiua/tilde"
license=('MIT')
conflicts=()
depends=(zlib hicolor-icon-theme)
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Tilde-${pkgver}.AppImage")
_install_path="/opt/appimages"
sha512sums=('cc857618d5bd1e8c9d1b929e5f32e102561039f960c4fd213fbeb6c58e4ead1bc6a6654078be9703e41dccc84f41ade76348f9f1e8177792047c09a5886daaba')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/\#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 600x600 800x800 1024x1024 1600x1600 3200x3200;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

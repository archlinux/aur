# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="eudic-appimage"
pkgver=12.7.1
pkgrel=3
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-appimage}")
providers=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
options=(!strip)
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://static-main.frdic.com/pkg/${pkgname%-appimage}.AppImage?v=2023-04-12"
    "LICENSE::https://www.eudic.net/v4/home/privacy")
sha256sums=('7fb7d6dabc1faf46d7c09cb428d7728ad88372bbb690a48b4a140884e787ba1a'
            '3781d50b87b64059ea24d8e38b0a95888104eec2d1113b469d623ac87f232ffd')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=/usr/share/eudic/AppRun|Exec=/opt/appimages/eudic.AppImage|g;s|Icon=ecom.eusoft.eudic|Icon=eudic|g' -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.eudic.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
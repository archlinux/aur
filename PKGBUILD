# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=eudic
pkgname="${_pkgname}-appimage"
pkgver=12.7.1
pkgrel=3
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('custom')
options=(!strip)
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://static-main.frdic.com/pkg/${_pkgname}.AppImage?v=2023-03-16"
    "LICENSE::https://www.eudic.net/v4/home/privacy")
sha256sums=('7fb7d6dabc1faf46d7c09cb428d7728ad88372bbb690a48b4a140884e787ba1a'
            '5fe3c67d822233995d9694b42fdd1b8c34507b4c70ba06931f7fbb66a2a11876')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/eudic.AppImage/g;s/Icon=ecom.eusoft.eudic/Icon=eudic/g' -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.eudic.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
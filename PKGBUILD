# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wolai-appimage
_pkgname=wolai
pkgver=1.2.6
pkgrel=1
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=("x86_64")
url="https://www.wolai.com"
license=(unknown)
depends=(hicolor-icon-theme zlib)
options=(!strip)
provides=()
conflicts=(wolai-bin)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://cdn.wostatic.cn/dist/installers/${_pkgname}-${pkgver}.AppImage")
sha256sums=('8e26a5be413d5cd9efe2bf5f37897d443fc6e7236e4ef2c1502ea69d59760013')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/wolai.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
}

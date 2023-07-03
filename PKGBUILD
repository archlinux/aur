# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wolai-appimage"
pkgver=1.2.7
pkgrel=3
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.wolai.com"
license=('freeware')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::https://cdn.wostatic.cn/dist/installers/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::https://cdn.wostatic.cn/dist/installers/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::https://cdn.wostatic.cn/dist/installers/${pkgname%-appimage}-${pkgver}.AppImage")
source=("LICENSE::${url}/${pkgname%-appimage}/q5eyV15yEQPxBhjnFXyWtL")
sha256sums=('b0fbfbf99f5c160ad9d4f18a7ea8257c405dc631e11e3e8f77e17bc983e53f5a')
sha256sums_aarch64=('e45825e1f2442752d85ce5dd442a2f19cdb2f1e2bc017cd43f1609719d091a47')
sha256sums_armv7h=('e45825e1f2442752d85ce5dd442a2f19cdb2f1e2bc017cd43f1609719d091a47')
sha256sums_x86_64=('e4e931a23f379c3be7ab70902636f74c6446c6091e0287d6bb3967ce55129340')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: witt <1989161762 at qq dot com>

pkgname="wolai-appimage"
pkgver=1.2.10
pkgrel=1
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.wolai.com"
license=('freeware')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-bin")
_install_path="/opt/wolai"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::https://cdn.wostatic.cn/dist/installers/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::https://cdn.wostatic.cn/dist/installers/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::https://cdn.wostatic.cn/dist/installers/${pkgname%-appimage}-${pkgver}.AppImage")
source=("LICENSE::${url}/${pkgname%-appimage}/q5eyV15yEQPxBhjnFXyWtL")
sha256sums=('b69ed040a2fc03e49beaf3650aad3bd28362f11005ff4296054d44ee7d50b647')
sha256sums_aarch64=('c89b008b71dbceaf8fb5d475ad5fba57b82619dc536317160eab3e42baed64ab')
sha256sums_armv7h=('c89b008b71dbceaf8fb5d475ad5fba57b82619dc536317160eab3e42baed64ab')
sha256sums_x86_64=('5577a38b800ff637284de4cb1e767a4f8d26256d008166516152c6bc1b231334')
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

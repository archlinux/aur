# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bilibilivideodownload-appimage"
pkgver=3.3.3
pkgrel=1
pkgdesc="Cross-platform download bilibili video desktop software."
arch=('x86_64')
url="https://github.com/blogwy/BilibiliVideoDownload"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
replaces=('bilibili-videodownloader-appimage')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/BilibiliVideoDownload-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/BilibiliVideoDownload/BilibiliVideoDownload/master/LICENSE")
sha256sums=('e623be15d2779963943d4290cdfa89aa5d685fb0d78eee0a252cf908d60f6ba2'
            'e4d41ebef13a799b7ae9dceebe3a39a6c3e7c18c7a91728c0a73a8ae4baabcc3')
    
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/bilibilivideodownload.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
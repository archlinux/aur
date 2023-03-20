# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-appimage
_pkgname=apifox
pkgver=2.2.0
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://www.apifox.cn/"
license=('unknow')
conflicts=(apifox)
providers=(apifox)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
_install_path="/opt/appimages"
source=(
  "${_pkgname}-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-latest.zip"
)
sha256sums=('076800f9d55cf8129c9177f09085ba89446d8e20d54542b9c51c41b7bb495a69')
   
prepare() {
    chmod a+x "Apifox.AppImage"
    "./Apifox.AppImage" --appimage-extract
    sed 's/AppRun/\/opt\/appimages\/apifox.AppImage/g;s/Utility/Utility;Development;/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/Apifox.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

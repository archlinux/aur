# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=apifox
pkgname="${_pkgname}-appimage"
pkgver=2.2.32
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://www.apifox.cn/"
license=('custom')
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-latest.zip")
sha256sums=('3be71da14210652162e68dcc355bb67af53f9e9d8059a9f7b94d30d903809099')
   
prepare() {
    chmod a+x "Apifox.AppImage"
    "./Apifox.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/apifox.AppImage/g;s/Utility/Utility;Development;/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/Apifox.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

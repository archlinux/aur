# Maintainer: qvshuo <qvshuo at foxmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="yesplaymusic"
pkgname="${_pkgname}-appimage"
pkgver=0.4.7
pkgrel=2
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux。"
arch=('x86_64')
url="https://music.qier222.com/"
_githuburl="https://github.com/qier222/YesPlayMusic"
license=(MIT)
depends=(hicolor-icon-theme glibc zlib)
options=(!strip)
provides=(qier222)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.AppImage"
  "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('cb4876bbf938502acac84ff68febc863e2bcdf9a5e4a4b964e17309b7ee3704e'
            '58ca0d87d53ea8afd6fed7b393eaf30060034debe576c44ce7a9e4111668dd65')
 
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/yesplaymusic.AppImage/g;s/Music/AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 88x88 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=subtitler
pkgname="${_pkgname}-appimage"
pkgver=1.5.5
pkgrel=2
pkgdesc="Quickly download subtitles"
arch=("x86_64")
url="https://s8sachin.github.io/subtitler/"
_githuburl="https://github.com/s8sachin/subtitler"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Subtitler-${pkgver}.AppImage"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('031b8a772c86dfe024c768149b1dfaf42cbc88f415d1864563b6a41bee67f5d6'
            '910e8030c09f74d9e027c4cd75ad09484e4897c4a92c7114651a188cbaf3a80d')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/subtitler.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
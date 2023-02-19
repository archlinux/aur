# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flb-music-player-appimage
_pkgname=FLB-Music
pkgver=1.2.1
pkgrel=1
pkgdesc="A beautiful Feature Rich Music Player and Downloader,cross platform"
arch=('x86_64')
url="https://flbmusic.xyz/"
_githuburl="https://github.com/FLB-Music/FLB-Music-Player"
license=('GPL3')
conflicts=()
depends=(zlib hicolor-icon-theme)
options=(!strip)
source=(
  "${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-1.2.1.AppImage"
  "${_pkgname}-${pkgver}.zip::https://github.com/FLB-Music/FLB-Music-Player/archive/refs/heads/main.zip"
  "${pkgname}.desktop"
)
sha512sums=('a81cb8dc37a661f465b0add064f9d5ebc4dd9b0baa18bdf685c6dc2374fe821e188b90b7509d6a96a7fe181aa10a2b72ee13f4d6f1d06312b404d815f328e684'
            'a051175743ca9fc8b3e66c435f6b7487d34466f3deb3e8fdcf3016aa5512265dfd42007ea872d761adf3a82f756a3ef7722c4351846a8d866d5b9d92714cae69'
            '3127490fcf237898b9915fd47e79541fba1727f33fd71420b7f238748265d3e9c4655670895c3e1b92855aaf698d64090ef0817072dce35d03b76a3874e26cbf')

_install_path="/opt/appimages/"
prepare() {
    chmod a+x ${_pkgname}-${pkgver}.AppImage
    unzip "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/${_pkgname}-Player-main/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/${_pkgname}-Player-main/icons/${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

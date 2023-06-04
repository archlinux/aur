# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pixelviewer-bin
_appname=PixelViewer
pkgver=2.7.4.312
pkgrel=1
pkgdesc="A cross-platform image viewer which supports reading raw Luminance/YUV/RGB/ARGB/Bayer pixels data from file and rendering it."
arch=('aarch64' 'x86_64')
url="https://carina-studio.github.io/PixelViewer/"
_githuburl="https://github.com/carina-studio/PixelViewer"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-bin}")
depends=('fontconfig' 'zlib' 'glibc' 'gcc-libs')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-x64.zip")
source=("LICENSE.md::https://raw.githubusercontent.com/carina-studio/PixelViewer/master/LICENSE.md")
sha256sums=('4b023d792eb6b929311286a207c6493e18875bd9d320db8f7a996dd5d5716fea')
sha256sums_aarch64=('92bfb0c33f2cf808ef56ebff1a5255613122c15ff6ad6097d91a16214f61317f')
sha256sums_x86_64=('55ca0c80d5adfb9a0b9661622c789b84646f3e3875faad6b8f61f17bca9380ab')
      
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f --icon "${pkgname%-bin}" --categories "Graphics;Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linked-bin
pkgver=1.5.2
pkgrel=2
pkgdesc="Daily journaling without distraction. An easy, distraction-free way to record your thoughts, declutter your mind and keep the things you want to remember. "
arch=('x86_64')
url="https://uselinked.com/"
_githuburl="https://github.com/lostdesign/linked"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'electron17' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('44fc87edf617d445a014ddc637ae547371f218f803b2558d0e1014d3879483cf'
            '3dfd4b5fca8767a7da9f2aa675be5ce6c05e6afc975be893ae3a9d92b29d3c51')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
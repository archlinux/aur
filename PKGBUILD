# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=metronome-bin
pkgver=0.1.6
pkgrel=3
pkgdesc="A metronome built w/ Tauri + React. Tempo tapper, themes, hotkeys and more!"
arch=("x86_64")
url="https://zane.pw/metronome"
_githuburl="https://github.com/ZaneH/metronome"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('glibc' 'webkit2gtk' 'hicolor-icon-theme' 'cairo' 'libsoup' 'glib2' 'gtk3' 'pango' 'gdk-pixbuf2' 'openssl' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ZaneH/metronome/master/LICENSE")
sha256sums=('404140a09aca92b2506a3289584306db97410e32ba4824b598b33e596306e159'
            'ba4c8659a2e7cd4de217c1a66726bbb8f10a0bfa3b0882b241341971c67e3636')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
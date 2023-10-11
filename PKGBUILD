# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sentio-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="A productivity type desktop app built around the pomodoro concept."
arch=("x86_64")
url="https://intentio.app/"
_githuburl="https://github.com/JakubGluszek/intentio"
license=("Apache" "custom:CC-1.0")
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gdk-pixbuf2' 'webkit2gtk' 'glibc' 'alsa-lib' 'hicolor-icon-theme' 'openssl' 'dbus' 'gcc-libs' 'glib2' 'gtk3' 'cairo')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/JakubGluszek/intentio/v${pkgver}/LICENSE")
sha256sums=('ee466721e1ced1d3d367d4bc4d41bfa21be02f8c8d1f90e200fd97e7e5a3e9b0'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/assets/audio/"*.ogg -t "${pkgdir}/usr/lib/${pkgname%-bin}/assets/audio"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
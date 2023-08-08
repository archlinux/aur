# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sentio-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="A productivity type desktop app built around the pomodoro concept."
arch=("x86_64")
url="https://intentio.app/"
_githuburl="https://github.com/JakubGluszek/intentio"
license=("Apache" "CC-1.0")
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gdk-pixbuf2' 'webkit2gtk' 'glibc' 'alsa-lib' 'hicolor-icon-theme' 'openssl' 'dbus' 'gcc-libs' 'glib2' 'gtk3' 'cairo')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/JakubGluszek/intentio/main/LICENSE")
sha256sums=('ee466721e1ced1d3d367d4bc4d41bfa21be02f8c8d1f90e200fd97e7e5a3e9b0'
            'f79590957fc8df48d1f603b4c1c6da9fb1c26eba95cfd6de1e7cfdcc8abd98a5')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
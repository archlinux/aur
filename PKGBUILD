# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgver=2.1.6-beta
pkgname=espanso-bin
pkgver=2.1.6
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=("!strip")  # AppImage
source=("espanso-${_pkgver}::https://github.com/federico-terzi/espanso/releases/download/v${_pkgver}/Espanso-X11.AppImage"
        "espanso-${_pkgver}.service::https://raw.githubusercontent.com/federico-terzi/espanso/v${_pkgver}/espanso/src/res/linux/systemd.service")
noextract=("espanso-${_pkgver}")
sha512sums=('42e69dcb88e1047cffc8f9b251dfb28870f3d179c8eadcff3c9fc831817c231304de6bf601cbad58e006cf99b7be3f43db35ff73a546b8eff7c220b34e9c20b2'
            'dbfb208a34a76cf03d46232119a83a57bc1f81d102e17e6dda7c3b41039e010061b4352cd107e482c6f9bfd6457fa757ebbcd0261084f20e2757a5b186a24c20')


prepare() {

    sed "s|{{{espanso_path}}}|/usr/bin/espanso|g" "espanso-${_pkgver}.service" > "systemd.service"
}

package() {

    install -Dm755 "espanso-${_pkgver}" "${pkgdir}/usr/bin/espanso"
    install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/user/espanso.service"
}

# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=espanso
pkgname=${_pkgname}-bin
pkgver=0.4.1
pkgrel=2
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip" "libxtst" "libnotify")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("espanso-linux-${pkgver}.tar.gz::https://github.com/federico-terzi/espanso/releases/download/v${pkgver}/espanso-linux.tar.gz"
        "https://raw.githubusercontent.com/federico-terzi/espanso/v${pkgver}/src/res/linux/systemd.service")
sha512sums=('7ff6fb5bbd5b74dd8561e7f99bdc5defb30eb2825109eec474ef8fc6a3f51da1513890d22ab307f6d27b5020790e2342004b0fea99ac68fff4d26c5d9fa26115'
            '8f30ebc5dbb633f9cdd464765df38e6ef3fa008ba6d2fa83d66eed992a9e2c8be41fadbeb1d3048738078357bb72c78663900b5970f5061a0175c72cd5053dad')


prepare() {
    sed -i "s|{{{espanso_path}}}|/usr/bin/espanso|g" "systemd.service"
}

package() {

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}

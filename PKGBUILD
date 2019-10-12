# Maintainer: Your Name <youremail@domain.com>

_pkgname=espanso
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip" "libxtst")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("https://github.com/federico-terzi/espanso/releases/download/v${pkgver}/espanso-linux.tar.gz"
        "https://raw.githubusercontent.com/federico-terzi/espanso/v${pkgver}/src/res/linux/systemd.service")
sha512sums=('99c75ac409e441314fdd361929fc1b3b8555fa14e9ecc257a09e02c14736407831a1b4177a9f7516abf56edc43f752e7f388f0ae9e6ea7622e28171274a7af2c'
            '8f30ebc5dbb633f9cdd464765df38e6ef3fa008ba6d2fa83d66eed992a9e2c8be41fadbeb1d3048738078357bb72c78663900b5970f5061a0175c72cd5053dad')


prepare() {
    sed -i "s|{{{espanso_path}}}|/usr/bin/espanso|g" "systemd.service"
}

package() {

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}

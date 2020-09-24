# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=espanso
pkgname=${_pkgname}-bin
pkgver=0.7.2
pkgrel=2
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip" "libxtst" "libnotify")
optdepends=("modulo: Support for interactive forms")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("espanso-linux-${pkgver}.tar.gz::https://github.com/federico-terzi/espanso/releases/download/v${pkgver}/espanso-linux.tar.gz"
        "https://raw.githubusercontent.com/federico-terzi/espanso/v${pkgver}/src/res/linux/systemd.service")
sha512sums=('2838621f900dfe2c2a9338f24d77da9e79d275700ca6ec73beb027a10cb91ec621688713bbd7102e932f6700d4384531188c2c23d45207dff06357e97fa46ca0'
            '8f30ebc5dbb633f9cdd464765df38e6ef3fa008ba6d2fa83d66eed992a9e2c8be41fadbeb1d3048738078357bb72c78663900b5970f5061a0175c72cd5053dad')


prepare() {
    sed -i "s|{{{espanso_path}}}|/usr/bin/espanso|g" "systemd.service"
}

package() {

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}

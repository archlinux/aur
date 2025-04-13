# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=espanso-x11-bin
pkgver=2.2.3
pkgrel=1
pkgdesc='Cross-platform Text Expander written in Rust'
arch=('x86_64')
url='https://espanso.org'
license=('GPL-3.0-only')
depends=('xdotool' 'xclip')
provides=('espanso')
conflicts=('espanso')
options=('!debug' '!strip')
source=("espanso::https://github.com/espanso/espanso/releases/download/v${pkgver}/Espanso-X11.AppImage"
        "espanso.service::https://raw.githubusercontent.com/espanso/espanso/v${pkgver}/espanso/src/res/linux/systemd.service")
sha256sums=('0dd4b3d33cb0f8b5fee9176c61257d99112426acb1f53585571e5c99e96ed78e'
            '0448185f394858b1f06c6458869e932da317501759c3f018a696d7789b15e8b9')

prepare() {
    sed -i 's|{{{espanso_path}}}|/usr/bin/espanso|g' "${srcdir}/espanso.service"
}

package() {
    install -Dm755 "${srcdir}/espanso" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/espanso.service" -t "${pkgdir}/usr/lib/systemd/user/"
}

# vim: ts=4 sw=4 et:

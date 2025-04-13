# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=espanso-x11-bin
pkgver=2.2.1
pkgrel=1
pkgdesc='Cross-platform Text Expander written in Rust'
arch=('x86_64')
url='https://espanso.org'
license=('GPL-3.0-only')
depends=('xdotool' 'xclip')
provides=('espanso')
conflicts=('espanso')
options=('!strip')
source=("espanso::https://github.com/espanso/espanso/releases/download/v${pkgver}/Espanso-X11.AppImage"
        "espanso.service::https://raw.githubusercontent.com/espanso/espanso/v${pkgver}/espanso/src/res/linux/systemd.service")
sha256sums=('1f91e3f16af11f6a3965775cb27e5bf2875dae375f6f6f1e8dc6a83f2888219b'
            '0448185f394858b1f06c6458869e932da317501759c3f018a696d7789b15e8b9')

prepare() {
    sed -i 's|{{{espanso_path}}}|/usr/bin/espanso|g' "${srcdir}/espanso.service"
}

package() {
    install -Dm755 "${srcdir}/espanso" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/espanso.service" -t "${pkgdir}/usr/lib/systemd/user/"
}

# vim: ts=4 sw=4 et:

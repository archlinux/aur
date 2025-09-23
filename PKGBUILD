# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=espanso-x11-bin
pkgver=2.2.7
pkgrel=1
pkgdesc='Cross-platform Text Expander written in Rust'
arch=('x86_64')
url='https://espanso.org'
license=('GPL-3.0-only')
depends=(
    'xclip'
    'xdotool'
)
provides=('espanso')
conflicts=('espanso')
options=(
    '!debug'
    '!strip'
)
source=(
    "espanso::https://github.com/espanso/espanso/releases/download/v${pkgver}/Espanso-X11.AppImage"
    "espanso.service::https://raw.githubusercontent.com/espanso/espanso/v${pkgver}/espanso/src/res/linux/systemd.service"
    "espanso.png::https://raw.githubusercontent.com/espanso/espanso/v${pkgver}/espanso/src/res/icon.png"
    'espanso.desktop'
)
sha256sums=(
    'c84effb9d0c06dea6970df9a56b507fc99435c8416e54857727a1db9da0e238c'
    '0448185f394858b1f06c6458869e932da317501759c3f018a696d7789b15e8b9'
    '8c031ec3a53e678883fc72b6789b4e35ef12e3d543a40088adf808c5f851ad9f'
    'SKIP'
)

prepare() {
    sed -i 's|{{{espanso_path}}}|/usr/bin/espanso|g' "${srcdir}/espanso.service"
}

package() {
    install -Dm755 "${srcdir}/espanso" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/espanso.service" -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 "${srcdir}/espanso.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${srcdir}/espanso.desktop" -t "${pkgdir}/usr/share/applications/"
}

# vim: ts=4 sw=4 et:

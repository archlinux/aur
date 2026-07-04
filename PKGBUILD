# Maintainer: Artem Stasyuk <stasyukartem2@gmail.com>
pkgname=openfortivpn-gui-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="A modern GTK4/libadwaita GUI client for Fortinet SSL VPN on Linux, wrapping the openfortivpn CLI tool."
arch=('x86_64')
url="https://github.com/shini4i/openfortivpn-gui"
license=('GPL-3.0-only')

depends=(
    'openfortivpn'
    'glibc'
    'glib2'
    'gtk4'
    'libadwaita'
    'gdk-pixbuf2'
    'pango'
    'cairo'
    'graphene'
    'hicolor-icon-theme'
)

install=openfortivpn-gui.install

source=("https://github.com/shini4i/openfortivpn-gui/releases/download/v${pkgver}/openfortivpn-gui_${pkgver}_linux_amd64.tar.gz"
        "com.github.shini4i.openfortivpn-gui.desktop::https://raw.githubusercontent.com/XCroatoanX/openfortivpn-gui/main/data/com.github.shini4i.openfortivpn-gui.desktop"
        "openfortivpn-gui-helper.service::https://raw.githubusercontent.com/shini4i/openfortivpn-gui/main/data/openfortivpn-gui-helper.service"
        "hicolor.tar.xz")

sha256sums=('f4de7f6e47bd85cd5e3e9e4ae5cc0d6e81e9b5a803f66d3521fc82a7a3d6f689'
            'SKIP'
            'SKIP'
            '61d2d0454a3d96355b202bcdfee0a59b1c38cc838c23b560cdf2e4edae2cef32')

package() {
    cd "${srcdir}"
    install -Dm755 "openfortivpn-gui" "${pkgdir}/usr/bin/openfortivpn-gui"
    install -Dm755 "openfortivpn-gui-helper" "${pkgdir}/usr/bin/openfortivpn-gui-helper"
    install -Dm644 "openfortivpn-gui-helper.service" "${pkgdir}/usr/lib/systemd/system/openfortivpn-gui-helper.service"
    echo "StartupWMClass=com.github.shini4i.openfortivpn-gui" >> "com.github.shini4i.openfortivpn-gui.desktop"
    install -Dm644 "com.github.shini4i.openfortivpn-gui.desktop" "${pkgdir}/usr/share/applications/com.github.shini4i.openfortivpn-gui.desktop"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    cp -r "${srcdir}/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}

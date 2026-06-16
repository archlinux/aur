# Maintainer: Artem Stasyuk <stasyukartem2@gmail.com>
pkgname=openfortivpn-gui-bin
pkgver=0.3.3
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
        "openfortivpn-gui.desktop"
        "openfortivpn-gui-helper.service"
        "hicolor.tar.xz")

sha256sums=('578a35d704cef62814c71a8003e385d68af5b1190bcbe989ace54ee1a5fc1094'
            '2676c4f93aed03fdc4b9a11fd31501c16f2930bb3a3853f2fc36ed5127e0c0b9'
            'bc71e5006b6151faa511c991d3b7a84f080530d6fdda21a7800ac943ef2e1d03'
            '61d2d0454a3d96355b202bcdfee0a59b1c38cc838c23b560cdf2e4edae2cef32')

package() {
    cd "${srcdir}"
    install -Dm755 "openfortivpn-gui" "${pkgdir}/usr/bin/openfortivpn-gui"
    install -Dm755 "openfortivpn-gui-helper" "${pkgdir}/usr/bin/openfortivpn-gui-helper"
    install -Dm644 "openfortivpn-gui-helper.service" "${pkgdir}/usr/lib/systemd/system/openfortivpn-gui-helper.service"
    install -Dm644 "openfortivpn-gui.desktop" "${pkgdir}/usr/share/applications/openfortivpn-gui.desktop"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    cp -r "${srcdir}/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}

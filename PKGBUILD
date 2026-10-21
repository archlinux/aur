# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox
pkgver=1.3.9
pkgrel=1
pkgdesc="GTK4 GUI for managing QEMU virtual machines via quickemu"
arch=('any')
url="https://codeberg.org/linux-bird/quickbox"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'quickemu')
optdepends=('libnotify: desktop notifications')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5731693bfb9f566ff14ebee4bfffb2c561be098243073d69ff03afc2817c3aa9')

package() {
    cd "${srcdir}/${pkgname}"

    # Main executable
    install -Dm755 quickbox "${pkgdir}/usr/bin/quickbox"

    # Desktop entry
    install -Dm644 quickbox.desktop "${pkgdir}/usr/share/applications/quickbox.desktop"

    # Translations
    for f in translations/*.json; do
        install -Dm644 "$f" "${pkgdir}/usr/share/quickbox/${f}"
    done

    # Version
    install -Dm644 version "${pkgdir}/usr/share/quickbox/version"

    # Icon
    install -Dm644 "icons/hicolor/scalable/apps/quickbox.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/quickbox.svg"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

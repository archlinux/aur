# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox
pkgver=1.3.10
pkgrel=1
pkgdesc="GTK4 GUI for managing QEMU virtual machines via quickemu"
arch=('any')
url="https://codeberg.org/linux-bird/quickbox"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'quickemu' 'rsync' 'xdg-utils')
optdepends=(
    'libnotify: desktop notifications'
    'parted: format disk'
    'gtk3: system tray icon'
    'virt-viewer: SPICE display backend support'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a8138570e9971c24adb424de69b41995eb0d13524b464f63c843be71cff0d9c')

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

# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox
pkgver=1.3.7
pkgrel=1
pkgdesc="GTK4 GUI for managing QEMU virtual machines via quickemu"
arch=('any')
url="https://github.com/musqz/quickbox"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'quickemu')
optdepends=('libnotify: desktop notifications')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aad347554fce371ec66a32cff6681e5d81aa64968b19ac27e4cc2af925a403b9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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

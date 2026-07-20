# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox
pkgver=1.3.8
pkgrel=1
pkgdesc="GTK4 GUI for managing QEMU virtual machines via quickemu"
arch=('any')
url="https://github.com/musqz/quickbox"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'quickemu')
optdepends=('libnotify: desktop notifications')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('24a9b0a8939184c0b432f5a1b8a9d0955a216b59a6f3c690c8ca8e11798e965c')

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

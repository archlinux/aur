# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox
pkgver=1.3.8
pkgrel=2
pkgdesc="GTK4 GUI for managing QEMU virtual machines via quickemu"
arch=('any')
url="https://codeberg.org/linux-bird/quickbox"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'quickemu')
optdepends=('libnotify: desktop notifications')
source=("${pkgname}-${pkgver}-codeberg.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aed39f836d289988a458d8756d9b25753a9d291afc144f1e2c8aadeff1dc17e0')

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

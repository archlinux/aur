# Maintainer: 2-4601 <AUR@othermemory.org>
pkgname=atostekid
pkgver=4.2.1.0
pkgrel=2
pkgdesc="New desktop application for Finnish electronic ID cards"
arch=("x86_64")
url="https://dvv.fi/en/linux-versions"
license=("LicenseRef-Atostek")
depends=(
    "botan2"
    "ccid"
    "minizip"
    "nss"
    "pcsclite"
    "qpdf"
    "qt6-base"
)
optdepends=(
    "gnome-shell-extension-appindicator: System tray indicator extension for GNOME desktop"
    "libappindicator-gtk3: System tray support for desktop environments"
)
install=${pkgname}.install
source=(${pkgname}-${pkgver}.deb::"https://dvv.fi/documents/16079645/234352551/AtostekID_DEB_${pkgver//_/-}.deb")
sha256sums=(
    "d9d80be53478f002bb704be16528c353da4aabba5d06c7d7982510cbb0cf3f90"
)

package() {
    tar xf data.tar.xz -C "${pkgdir}"

    rm -rf "${pkgdir}/usr/lib/atostekid"
    install -D -m 644 "${pkgdir}/usr/share/doc/atostekid/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    install -m 644 "${pkgdir}"/usr/share/doc/atostekid/license_{en,fi,sv}.rtf "${pkgdir}/usr/share/licenses/${pkgname}/"
    rm "${pkgdir}"/usr/share/doc/atostekid/{copyright,license_{en,fi,sv}.rtf}
}

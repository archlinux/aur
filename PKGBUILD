# Maintainer: 2-4601 <AUR@othermemory.org>
pkgname=atostekid
pkgver=4.3.0.0
pkgrel=1
pkgdesc="New desktop application for Finnish electronic ID cards"
arch=("x86_64")
url="https://dvv.fi/en/linux-versions"
license=("LicenseRef-Atostek")
depends=(
    "botan2"
    "ccid"
    "libqpdf29"
    "minizip"
    "nss"
    "pcsclite"
    "qt6-base"
)
optdepends=(
    "gnome-shell-extension-appindicator: System tray indicator extension for GNOME desktop"
    "libappindicator-gtk3: System tray support for desktop environments"
)
install=${pkgname}.install
source=(${pkgname}-${pkgver}.deb::"https://dvv.fi/documents/16079645/237937167/AtostekID_DEB_${pkgver//_/-}.deb")
sha256sums=(
    "fc753b03e171b39e28bd9f85a43d0986409dbad6d72801cd1d63762a6f444f73"
)

package() {
    tar xf data.tar.xz -C "${pkgdir}"

    rm -rf "${pkgdir}/usr/lib/atostekid"
    install -D -m 644 "${pkgdir}/usr/share/doc/atostekid/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    install -m 644 "${pkgdir}"/usr/share/doc/atostekid/license_{en,fi,sv}.rtf "${pkgdir}/usr/share/licenses/${pkgname}/"
    rm "${pkgdir}"/usr/share/doc/atostekid/{copyright,license_{en,fi,sv}.rtf}
}

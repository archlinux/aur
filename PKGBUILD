# Maintainer: 2-4601 <AUR@othermemory.org>
pkgname=atostekid
pkgver=4.1.1.0
pkgrel=1
pkgdesc="New desktop application for Finnish electronic ID cards"
arch=("x86_64")
url="https://dvv.fi/en/linux-versions"
license=("LicenseRef-Atostek")
depends=(
    "botan2"
    "ccid"
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
source=(${pkgname}-${pkgver}.deb::"https://dvv.fi/documents/16079645/228119190/AtostekID_DEB_${pkgver//_/-}.deb")
sha256sums=("1b4c7137241dd396da201eb1c21f6363f81aa72169aecc58d78e23bdbe8e0f0c")

package() {
    tar xf data.tar.xz -C "${pkgdir}"

    rm -rf "${pkgdir}/usr/lib/atostekid"
    install -D -m 644 "${pkgdir}/usr/share/doc/atostekid/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    install -m 644 "${pkgdir}"/usr/share/doc/atostekid/license_{en,fi,sv}.rtf "${pkgdir}/usr/share/licenses/${pkgname}/"
    rm "${pkgdir}"/usr/share/doc/atostekid/{copyright,license_{en,fi,sv}.rtf}
}

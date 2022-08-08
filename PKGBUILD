# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=parallels-client
pkgver=19.0.23304
pkgrel=1
epoch=
pkgdesc="A remote work tool (RASClient)"
arch=('x86_64')
url="https://www.parallels.com/products/ras/capabilities/parallels-client/"
license=("custom:$pkgname")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.parallels.com/ras/v19/19.0.0.23304/RASClient-${pkgver}_x86_64.deb")
noextract=()
sha256sums=('908a8b78d20691dd349b767082e5c4bf9e9086db92f24a6e27cac53c08aad947')
validpgpkeys=()


package() {
    bsdtar --cd "${pkgdir}" -xf "${srcdir}/data.tar.xz"
    _optdir="2X/Client"

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Fix udev symlink
    rm "${pkgdir}/lib/udev/rules.d/90-rasusb.rules"
    ln -s "/opt/${optdir}/share/udev.rules" "${pkgdir}/lib/udev/rules.d/90-rasusb.rules"

    # Move license
    rm -rf "${pkgdir}/usr/share/doc"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${optdir}/doc/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

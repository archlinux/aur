# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=scarlett2-firmware-git
_pkgname=scarlett2-firmware
pkgver=2128b.1.g2a2a
pkgrel=1
pkgdesc='Scarlett2 Firmware for Scarlett 2nd/3rd/4th Gen, Clarett USB, and Clarett+ interfaces'
arch=('any')
url="https://github.com/geoffreybennett/$_pkgname"
provides=($_pkgname)
depends=()
makedepends=('git' 'sed')
license=('Proprietary')
source=("git+${url}.git")
sha256sums=('SKIP')

SYSTEM_FIRMWARE_DIR="/usr/lib/firmware/scarlett2"

pkgver() {
    cd "$_pkgname"
    echo "$(git describe --abbrev=4 --always --tags | sed 's/-/./g')"
}

package() {
    cd ${srcdir}/${_pkgname}
    install -vd                         "${pkgdir}${SYSTEM_FIRMWARE_DIR}"
    install -vm  644 firmware/*.bin     "${pkgdir}${SYSTEM_FIRMWARE_DIR}/"
    install -vDm 644 README.md          "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -vDm 644 LICENSE.Focusrite  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.Focusrite"
}

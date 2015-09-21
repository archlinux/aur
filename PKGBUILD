# Maintainer: Stefan Tatschner <stefan.tatschner@aisec.fraunhofer.de>

pkgbase="can-isotp"
pkgname=("can-isotp-modules" "can-isotp-headers")
_pkgname="can-isotp-modules"
pkgver=r822.856c160
pkgrel=1
pkgdesc="The can iso-tp kernel module (ALPHA)"
arch=('i686' 'x86_64')
url="https://github.com/hartkopp/can-isotp-modules"
license=('GPLv2')
depends=('linux-can')
makedepends=('linux-can-headers')
source=("git+https://github.com/hartkopp/can-isotp-modules.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/net/can"
    ./make_isotp.sh
}

package_can-isotp-modules() {
    install="${pkgname}.install"
    cd "${srcdir}/${_pkgname}/net/can"
    install -d "${pkgdir}/usr/lib/modules/extramodules-4.0-can"
    install "can-isotp.ko" "${pkgdir}/usr/lib/modules/extramodules-4.0-can/can-isotp.ko"
}

package_can-isotp-headers() {
    cd "${srcdir}/${_pkgname}/include/socketcan/can"
    install -d "${pkgdir}/usr/lib/modules/$(uname -r)/build/include/uapi/linux/can"
    install "isotp.h" "${pkgdir}/usr/lib/modules/$(uname -r)/build/include/uapi/linux/can/isotp.h"
}

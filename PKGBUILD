# past-Maintainer: Ryon Sherman <ryon.sherman@gmail.com>
# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

_pkgid=31864

pkgname=redfang
pkgver=2.5
pkgrel=1
pkgdesc="Redfang v2.5 is an enhanced version of the original application that finds non-discoverable Bluetooth devices by brute-forcing the last six bytes of the device's Bluetooth address and doing a read_remote_name()."

arch=('i686' 'x86_64')
license=('custom')
url="http://packetstormsecurity.com/files/${_pkgid}/${pkgname}.${pkgver}.tar.gz.html"

depends=('bluez-libs')
makedepends=('gcc')
source=("http://dl.packetstormsecurity.net/wireless/${pkgname}.${pkgver}.tar.gz")
sha256sums=('7cf45008810ca894b085ae0eb1a0071f0cb6989dd9ce35cfcd617fedf7018c7f')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i '1i#include <linux/limits.h>' fang.c
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    install -d ${pkgdir}/usr/{bin,share/licenses/${pkgname}}
    install -Dm0755 fang ${pkgdir}/usr/bin/${pkgname}
    install -Dm0644 README ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

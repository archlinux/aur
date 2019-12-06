# Maintainer: Parker Reed <parker.l.reed@gmail.com>

_pkgname='new-lg4ff'
pkgname='new-lg4ff-dkms-git'
pkgver='0.1.r0.ge7601c0'
pkgrel='1'
pkgdesc="Experimental Logitech force feedback module (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/berarma/new-lg4ff"
license=('GPL2')
install="${pkgname}.install"
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgname}-dkms")
source=(
    "git+https://github.com/berarma/new-lg4ff"
    "${pkgname}.install"
)
md5sums=(
    'SKIP'
    '6c5008edd485130b1a4752030bbaaa2d'
)


pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_pkgname}"
    sed -e "s/0.1/${pkgver}/" -i "dkms.conf"
}

package() {
    cd "$srcdir/${_pkgname}"
    install -dm 755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -dm 755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}/usbhid"
    install -m 644 usbhid/usbhid.h "${pkgdir}/usr/src/${_pkgname}-${pkgver}/usbhid/"
    install -m 644 hid-ids.h hid-lg.h hid-lg4ff.h "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
    install -m 644 hid-lg.c hid-lg2ff.c hid-lg3ff.c hid-lg4ff.c hid-lgff.c "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
    install -m 644 Kbuild Makefile dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
}

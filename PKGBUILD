# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
pkgver=3.99.5_SP05
_pkgver=3.99.5final.SP05
pkgrel=5
pkgdesc="PCSC Driver for Reiner SCT cyberjack Cardreaders"
arch=('i686' 'x86_64')
url="http://support.reiner-sct.de/"
license=('LGPL')
replaces=('ctapi-cyberjack')
conflicts=('ctapi-cyberjack')
depends=('libusb' 'pcsclite')
options=('!libtool' '!docs')
source=("http://support.reiner-sct.de/downloads/LINUX/V${pkgver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('c02ef256834e1edb6a81bc31d942e46e28d0ab88439178f6a6d2730cb9017546')

build() {
    cd "${pkgname}-${_pkgver}"

    autoreconf -i

    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man/man8 \
        --sysconfdir=/etc/"${pkgname}"  \
        --enable-udev \
        --with-usbdropdir=$(pkg-config libpcsclite --variable=usbdropdir)

    make
}

package() {
    cd "${pkgname}-${_pkgver}"
    make DESTDIR="${pkgdir}" install
}

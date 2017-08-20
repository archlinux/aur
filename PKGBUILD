# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP11
pkgver=3.99.5_${_sp}
_pkgver=3.99.5final.${_sp}
pkgrel=1
pkgdesc="PCSC Driver for Reiner SCT cyberjack Cardreaders"
arch=('i686' 'x86_64')
url="https://forum.reiner-sct.com/index.php?/forum/59-cyberjack-treiber-f%C3%BCr-linux/"
license=('LGPL')
replaces=('ctapi-cyberjack')
conflicts=('ctapi-cyberjack')
depends=('libusb' 'pcsclite')
options=('!libtool' '!docs')
source=("http://support.reiner-sct.de/downloads/LINUX/V${pkgver}/pcsc-cyberjack-${_pkgver}.tar.bz2")
sha256sums=('5cd78f527596f2905500b210d066ece62a8ab36a0d4d3677463805f8f4d3aa0c')

build() {
    cd "${pkgname}-${_pkgver}"

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

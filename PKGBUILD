# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP12
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
sha256sums=('32dc370111119a86ca598154b82b72d8c0a003dd09342a6d2fda14aa96aff312')

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

# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP15
pkgver=3.99.5_${_sp}
_pkgver=3.99.5final.${_sp}
pkgrel=1
pkgdesc="PCSC Driver for Reiner SCT cyberjack Cardreaders"
arch=('i686' 'x86_64' 'aarch64')
url="https://forum.reiner-sct.com/index.php?/forum/59-cyberjack-treiber-f%C3%BCr-linux/"
license=('LGPL')
replaces=('ctapi-cyberjack')
conflicts=('ctapi-cyberjack')
depends=('libusb' 'pcsclite')
options=('!libtool' '!docs')
source=("https://support.reiner-sct.de/downloads/LINUX/V${pkgver}/pcsc-cyberjack_${_pkgver}.tar.bz2")
sha256sums=('acb7c2832450718756713767c4b3ef500832d652ed51b35110b910b11ebd467a')

prepare() {
    cd "${pkgname}-${_pkgver}"

    autoreconf -i
}

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

# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP16
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
source=("https://support.reiner-sct.de/downloads/LINUX/V${pkgver}/pcsc-cyberjack-${_pkgver}.tar.bz2")
sha256sums=('141489261c0d436be4b92f78faf240c32694426685413d9d50e3585feba5eb79')

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

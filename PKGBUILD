# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP10
pkgver=3.99.5_${_sp}
_pkgver=3.99.5final.${_sp}
pkgrel=2
pkgdesc="PCSC Driver for Reiner SCT cyberjack Cardreaders"
arch=('i686' 'x86_64')
url="http://www.reiner-sct.com/support/download/treiber-und-software/cyberjack/chip-linux.html?grp=kontaktbehaftet"
license=('LGPL')
replaces=('ctapi-cyberjack')
conflicts=('ctapi-cyberjack')
depends=('libusb' 'pcsclite')
options=('!libtool' '!docs')
source=("http://support.reiner-sct.de/downloads/LINUX/V${pkgver}/pcsc-cyberjack_${_pkgver}.tar.tar")
sha256sums=('11099c29594a73db19a4a0d9c448308c9c1ec3868862fd3838d0849b0debc7a8')

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

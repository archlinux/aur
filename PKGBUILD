# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP08
pkgver=3.99.5_${_sp}
_pkgver=3.99.5final.${_sp}
pkgrel=1
pkgdesc="PCSC Driver for Reiner SCT cyberjack Cardreaders"
arch=('i686' 'x86_64')
url="http://www.reiner-sct.com/support/download/treiber-und-software/cyberjack/chip-linux.html?grp=kontaktbehaftet"
license=('LGPL')
replaces=('ctapi-cyberjack')
conflicts=('ctapi-cyberjack')
depends=('libusb' 'pcsclite')
options=('!libtool' '!docs')
source=("http://www.kernelport.com/reiner-sct/${_sp}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('ab42b81ad685302c89763faaf0d90e23f804134e020d653323ad9f95a43655fc')

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

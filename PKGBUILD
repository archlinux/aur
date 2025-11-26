# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP17
pkgver=3.99.5_${_sp}
_pkgver=3.99.5final.${_sp}
pkgrel=1
pkgdesc="PCSC Driver for Reiner SCT cyberjack Cardreaders"
arch=('i686' 'x86_64' 'aarch64')
url="https://forum.reiner-sct.com/index.php?/forum/59-cyberjack-treiber-f%C3%BCr-linux/"
license=('GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later')
replaces=('ctapi-cyberjack')
conflicts=('ctapi-cyberjack')
depends=('gcc-libs' 'glibc' 'libusb' 'pcsclite')
options=('!libtool' '!docs')
source=("https://support.reiner-sct.de/downloads/LINUX/V${pkgver}/pcsc-cyberjack-${_pkgver}.tar.bz2")
sha256sums=('f1a8e15db3a4268b0d79c32a76195b34d79518bb891685443e253311f9e9d30a')

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

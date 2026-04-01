# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>

pkgname=abcccid
pkgver=2.2.2
pkgrel=1
pkgdesc='AB Circle CCID Smart Card Reader Driver'
arch=('x86_64')
url='https://www.abcircle.com/en/downloads/'
license=('LGPL-2.1-or-later')
depends=('pcsclite' 'libusb')
makedepends=('perl' 'flex' 'pkg-config')
source=("https://www.abcircle.com/download/261/Circle_USB_Linux_Mac_Driver_v${pkgver}.zip")
sha256sums=('1a4e9a1b25b94d45dbabcbfb5abb18388558521d51c0b692dcc760d3cc1b5580')

prepare() {
    cd "Circle_USB_Linux_Mac_Driver_v${pkgver}"

    tar xf "${pkgname}-${pkgver}.tar.bz2"
}

build() {
    cd "Circle_USB_Linux_Mac_Driver_v${pkgver}/${pkgname}-${pkgver}"

    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "Circle_USB_Linux_Mac_Driver_v${pkgver}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    install -D -m0644 "src/92_pcscd_abcccid.rules" "${pkgdir}/usr/lib/udev/rules.d/92_pcscd_abcccid.rules"
}

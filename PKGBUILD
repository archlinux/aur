# Maintainer: rnestler

_pkgname=avrdude
pkgname=avrdude-bobdude
pkgver=6.3
pkgrel=1
pkgdesc="Download/upload/manipulate the ROM and EEPROM contents of AVR microcontrollers. Version which is compatible with bobdude"
arch=('x86_64')
url="http://www.nongnu.org/avrdude/"
license=('GPL')
depends=('readline' 'libftdi' 'libusb')
provides=(avrdude)
conflicts=(avrdude 'libftdi-compat' 'libusb-compat')
source=(http://download.savannah.gnu.org/releases/avrdude/${_pkgname}-${pkgver}.tar.gz{,.sig}
        libavrdude.pc)
validpgpkeys=('EF497ABE47ED91B3FC3D7EA54D902FF7723BDEE9' '5E84F980C3CAFD4BB5841070F48CA81B69A85873' 'F48CA81B69A85873')
md5sums=('58bb42049122cf80fe4f4d0ce36d92ee'
         'SKIP'
         '5db7bbff83f3b2490e4d3b7c52855071')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./configure --mandir=/usr/share/man \
                --prefix=/usr \
                --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/libavrdude.pc" "${pkgdir}/usr/lib/pkgconfig/libavrdude.pc"
}

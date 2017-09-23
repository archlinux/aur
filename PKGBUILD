# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=bit-babbler
pkgver=0.7
pkgrel=1
pkgdesc='BitBabbler hardware TRNG and kernel entropy source support'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://www.bitbabbler.org'
depends=('libusb>=1.0')
optdepends=('munin: monitoring support')
source=("${url}/downloads/${pkgname}_${pkgver}.tar.gz"
        "${url}/downloads/${pkgname}_${pkgver}.tar.gz.asc"
        "seedd.service")
install="${pkgname}.install"
sha256sums=('9541547f0efb8954a3544ca1495b603e920f9b9509c9ee64840a389a0f665e4e'
            'SKIP'
            'c5dbc6f87530c9dee67e7a9df73bffd9b425a3cf03c6a82081f9b7b4f55f59b1')
validpgpkeys=('8EAF735424339DDDFE835628125831AE66E70556') # BitBabbler Support <support@bitbabbler.org>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 debian/bit-babbler-sysctl.conf "${pkgdir}/etc/sysctl.d/bit-babbler-sysctl.conf"
  install -Dm644 debian/bit-babbler.udev "${pkgdir}/etc/udev/rules.d/bit-babbler.rules"
  install -Dm644 "${srcdir}/seedd.service" "${pkgdir}/usr/lib/systemd/system/seedd.service"
}

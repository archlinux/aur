# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=bit-babbler
pkgver=0.8
pkgrel=1
pkgdesc='Read entropy from BitBabbler hardware RNG devices'
arch=('i686' 'x86_64')
url='http://www.bitbabbler.org'
license=('GPL2')
depends=('libusb>=1.0')
optdepends=('munin: monitoring support')
source=("${url}/downloads/${pkgname}_${pkgver}.tar.gz"
        "${url}/downloads/${pkgname}_${pkgver}.tar.gz.asc")
install="${pkgname}.install"
sha256sums=('ef360a921b54979cfe4bd842b48e411eb0340dc323b7b2d99078ef28e7de0c09'
            'SKIP')
validpgpkeys=('8EAF735424339DDDFE835628125831AE66E70556') # BitBabbler Support <support@bitbabbler.org>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 debian/bit-babbler-sysctl.conf "${pkgdir}"/etc/sysctl.d/bit-babbler-sysctl.conf
  install -Dm644 debian/bit-babbler.udev "${pkgdir}"/etc/udev/rules.d/bit-babbler.rules
  mv "${pkgdir}"/lib "${pkgdir}"/usr/lib
}

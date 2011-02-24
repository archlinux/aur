# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.4.2
pkgrel=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver"
arch=('i686' 'x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL' 'GPL')
depends=('pcsclite')
makedepends=('pkgconfig')
backup=(etc/reader.conf.d/libccidtwin)
source=(https://alioth.debian.org/frs/download.php/3518/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4a8f954c0aef48e8e5ab5d458cf819e8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-twinserial || return 1

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -D -m644 src/92_pcscd_ccid.rules  "${pkgdir}/lib/udev/rules.d/85-pcscd-ccid.rules" || return 1 
}

# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.4.1
pkgrel=2
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver"
arch=('i686' 'x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL')
depends=('pcsclite')
makedepends=('pkgconfig')
source=(https://alioth.debian.org/frs/download.php/3475/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fef5f950dc35202df2fed832498986b9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-twinserial || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/src/92_pcscd_ccid.rules \
                  "${pkgdir}/etc/udev/rules.d/92_pcscd_ccid.rules" || return 1 
}

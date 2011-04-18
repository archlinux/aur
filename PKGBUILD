# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.4.3
pkgrel=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver"
arch=('i686' 'x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL' 'GPL')
depends=('pcsclite')
makedepends=('pkgconfig')
backup=(etc/reader.conf.d/libccidtwin)
source=("https://alioth.debian.org/frs/download.php/3535/${pkgname}-${pkgver}.tar.bz2")
md5sums=('a269baa572be6f93ec57da279c7ec276')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-twinserial

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 src/92_pcscd_ccid.rules  "${pkgdir}/lib/udev/rules.d/85-pcscd-ccid.rules" || return 1 
}

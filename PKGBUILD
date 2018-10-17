# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libibmad
pkgver=1.3.13
pkgrel=4
pkgdesc='OpenFabrics Alliance InfiniBand MAD (MAnagement Datagram) library'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('rdma-core')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz")
sha256sums=('17cdd721c81fecefc366601c46c55a4d44c93799980a0a34c271b12bc544520b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README "${pkgdir}/usr/share/docs/${pkgname}/README"
}

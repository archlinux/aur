# Maintainer: James Harvey <jamespharvey20@gmail.com>
# namcap says dependency 'libibmad' is not needed, but without it, configure fails with "cannot find infiniband/mad.h", provided by libibmad, and mstflint-4.0.1/mtcr_ul/mtcr_ib_ofed.c does include "infiniband/mad.h"

pkgname=mstflint
pkgver=4.5.0
_pkgver_subver=1.17
_pkgver_commit=g8a0c39d
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application for Mellanox HCA/NIC cards'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('bash' 'zlib' 'libibmad')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}.${_pkgver_commit}.tar.gz")
md5sums=('adf8ca4ceab434e0fa6dc1ac3e0ff95a')

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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

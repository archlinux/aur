# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libmthca
pkgver=1.0.5
_pkgver_subver=0.1
_pkgver_commit=gbe5eef3
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand Mellanox InfiniBand HCA driver'
#        Plug-in module for libibverbs.
#        Allows programs to use Mellanox hardware directly from userspace.
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/downloads/${pkgname}/README.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/libmthca/${pkgname}-${pkgver}-${_pkgver_subver}.${_pkgver_commit}.tar.gz")
md5sums=('685e4d142d7f1c8fbd1413bbef325153')

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
}

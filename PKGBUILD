# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libcxgb4
pkgver=1.3.5
pkgrel=1
pkgdesc='OpenFabrics Alliance userspace Chelsio T4/T5 iWARP RNIC driver'
#        Plug-in module for libibverbs.
#        Allows programs to use Chelsio hardware directly from userspace.
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/downloads/cxgb4/README.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/cxgb4/${pkgname}-${pkgver}.tar.gz")
md5sums=('d186d374318511c2a0c572f1433ac2c2')

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

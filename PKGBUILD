# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns about dependency sh being included but already satisfied, and if not included, errors about it being detected and not included
# * Went with including it, winding up with a harmless warning

pkgname=libipathverbs
pkgver=1.3
pkgrel=1
pkgdesc='OpenFabrics Alliance userspace Intel InfiniBand HCA driver for libibverbs'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs' 'sh')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('740692ea205c49f7b2be9f81207474cf')

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

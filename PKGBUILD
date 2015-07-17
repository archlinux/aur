# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libibcm
pkgver=1.0.5
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand userspace communication manager'
#        Handles connection establishment and service ID resolution
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/rdmacm/${pkgname}-${pkgver}.tar.gz")
md5sums=('7ede8d7e96d6a65f09f289767bd931ea')

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

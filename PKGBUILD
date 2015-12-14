# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libfabric
pkgver=1.1.0
pkgrel=1
pkgdesc='OpenFabrics Alliance fabric service interface communication library'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc')
source=("https://www.openfabrics.org/downloads/ofi/${pkgname}-${pkgver}.tar.gz")
md5sums=('c627e297a6ab532805a4a5f3911df719')

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
  # /usr/lib/libfabric is empty, libraries are in /usr/lib - remove it with rmdir rather than "rm -r" so it will fail if not empty (future versions)
  rmdir "${pkgdir}/usr/lib/${pkgname}"
}

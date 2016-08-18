# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libibumad
pkgver=1.3.10.2
pkgrel=2
pkgdesc='OpenFabrics Alliance InfiniBand uMAD (User MAnagement Datagram) library'
#        Functions which sit on top of uMAD modules in kernel.
#        Used by InfiniBand diagnostic and management tools.
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz")
md5sums=('dd017844c55713bd335aa229e6841d41')

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

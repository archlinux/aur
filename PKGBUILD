# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=ibsim
pkgver=0.6
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand simulator utilities'
#        Simulates InfiniBand fabric, which can be used by any libibumad based application
#        Works locally via unix sockets or remotely via inet sockets
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibmad' 'bash')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz")
md5sums=('d08e196d980e7c88066b3e5e25bf5432')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # ibsim doesn't use configure, just make
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make libpath=/usr/lib DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README "${pkgdir}/usr/share/licenses/${pkgname}/README"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r net-examples scripts "${pkgdir}/usr/share/doc/${pkgname}"
}

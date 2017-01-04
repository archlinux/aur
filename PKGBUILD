# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=perftest
pkgver=3.4
_pkgver_subver=0.6
_pkgver_commit=gc3435c2
pkgrel=1
pkgdesc='OpenFabrics Alliance Infiniband verbs performance testing and benchmarking tools'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('librdmacm' 'libibumad' 'bash')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}.${_pkgver_commit}.tar.gz")
md5sums=('6c5a94674c9ae7cc6b2a09f72cda9fc3')

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
  install -Dm755 runme "${pkgdir}/usr/bin/perftest-runme"
}

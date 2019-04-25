# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libfabric
pkgver=1.7.1
pkgrel=1
pkgdesc='OpenFabrics Alliance fabric service interface communication library'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'BSD')
depends=('glibc')
source=("https://github.com/ofiwg/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('312e62c57f79b7274f89c41823932c00b15f1cc8de9c1f8dce17cd7fdae66fa1')

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
  install -Dm644 README "${pkgdir}/usr/share/licenses/${pkgname}/README"
}

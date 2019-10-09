# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libfabric
pkgver=1.8.1
pkgrel=1
pkgdesc='OpenFabrics Alliance fabric service interface communication library'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'BSD')
depends=('glibc')
source=("https://github.com/ofiwg/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3c560b997f9eafd89f961dd8e8a29a81aad3e39aee888e3f3822da419047dc88')

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

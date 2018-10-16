# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libfabric
pkgver=1.6.2
pkgrel=1
pkgdesc='OpenFabrics Alliance fabric service interface communication library'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc')
source=("https://github.com/ofiwg/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b1a9cf8c47189a1c918f8b5710d05cb50df6b47a1c9b2ba51d927e97503b4df0')

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

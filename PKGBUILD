# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=fabtests
pkgver=1.7.2
pkgrel=1
pkgdesc='OpenFabrics Alliance high performance fabric library tests using libfabric'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'BSD')
depends=('libfabric' 'bash' 'ruby')
source=("https://github.com/ofiwg/libfabric/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b09e176732adb01289144bbc2fd06ae9c3c9767ea5a2027ab4d9c44fd0164749')

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
  install -Dm644 README "${pkgdir}/usr/share/docs/${pkgname}/README"
}

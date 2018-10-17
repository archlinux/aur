# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=dapl
pkgver=2.1.10
pkgrel=2
pkgdesc='OpenFabrics Alliance direct access transport libraries for InfiniBand'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/downloads/dapl/README.html'
license=('GPL2' 'custom:"Common Public License 1.0"' 'custom:"The BSD License"')
depends=('rdma-core')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8eb6df3b47fcaad8ea6d35453ffc884b1ef2148f7a0984a3556795bab650fa9b')

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
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 LICENSE2.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE2.txt"
  install -Dm644 README "${pkgdir}/usr/share/docs/${pkgname}/README"
}

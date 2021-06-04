# Maintainer: Matt Neilson <ichthyoboy at gmail dot com>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=clustalx
pkgver=2.1
pkgrel=6
pkgdesc="Multiple alignment of nucleic acid and protein sequences"
arch=('i686' 'x86_64')
provides=('clustalx')
url="http://www.clustal.org"
license=('LGPL3')
depends=('qt5-base')
source=(  "$url/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
          "patch"
          "QT.patch")

md5sums=( '5b1f2f1cc8e939411ab0f934cafa072a'
          '912b5f02ca1502f63636b089eb24f01e'
          '564c8dcc0456e1bca230d2331369e6b5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../QT.patch
  patch -p1 < ../patch
  sed -i 's/static//g' clustalx.pro
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 clustalx "${pkgdir}/usr/bin/clustalx"
  install -D -m644 colprot.xml "${pkgdir}/usr/share/${pkgname}/colprot.xml"
  install -D -m644 coldna.xml "${pkgdir}/usr/share/${pkgname}/coldna.xml"
  install -D -m644 coldna.xml "${pkgdir}/usr/share/${pkgname}/colprint.xml"
  install -D -m644 clustalx.hlp "${pkgdir}/usr/share/${pkgname}/clustalx.hlp"
}

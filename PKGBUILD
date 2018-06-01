# Contributor: Hoàng Đức Hiếu <arch@zahe.me>
# Contributor: Fernando
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=diffpdf
pkgver=2.1.3.1
_pkgver=953510df882d5b4ebb2e91a3315f163d728ce1bb
pkgrel=1
pkgdesc="Diffing pdf files visually or textually"
#url="http://www.qtrac.eu/diffpdf-foss.html"
url="https://gitlab.com/eang/diffpdf"
#screenshot="http://www.qtrac.eu/diffpdf.png"
screenshot="https://gitlab.com/eang/diffpdf/blob/master/images/icon.png"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('poppler-qt5')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-tools')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/eang/diffpdf/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('d3b0340760296837fdd0dcc442f3ef3a')

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}-${_pkgver}/
  #git clone https://gitlab.com/eang/diffpdf.git
  cmake -D CMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd ${srcdir}/${pkgname}-v${pkgver}-${_pkgver}/
  make DESTDIR=${pkgdir} install

  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  _tradir=${pkgdir}/usr/share/${pkgname}/translations
  install -dpm755 ${_licdir} ${_tradir}
  install -Dpm644 gpl-2.0.txt ${_licdir}/
  install -Dpm644 *.qm ${_tradir}/
}

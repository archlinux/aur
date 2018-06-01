# Contributor: Hoàng Đức Hiếu <arch@zahe.me>
# Contributor: Fernando
# Contributor: Manfred Sauter
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=diffpdf
pkgver=2.1.3.1
pkgrel=2
pkgdesc="Diffing pdf files visually or textually"
#url="http://www.qtrac.eu/diffpdf-foss.html"
url="https://gitlab.com/eang/diffpdf"
#screenshot="http://www.qtrac.eu/diffpdf.png"
screenshot="https://gitlab.com/eang/diffpdf/blob/master/images/icon.png"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('poppler-qt5')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-tools')
source=("https://gitlab.com/eang/diffpdf/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('e838cda78d763495e0c0671f704c7059')

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}/
  #git clone https://gitlab.com/eang/diffpdf.git
  cmake -D CMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd ${srcdir}/${pkgname}-v${pkgver}/
  make DESTDIR=${pkgdir} install

  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  _tradir=${pkgdir}/usr/share/${pkgname}/translations
  install -dpm755 ${_licdir} ${_tradir}
  install -Dpm644 gpl-2.0.txt ${_licdir}/
  install -Dpm644 *.qm ${_tradir}/
}

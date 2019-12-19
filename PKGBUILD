# Maintainer: Jan Sandberg <jan dot sandberg at gmx dot ch>

pkgname=comparepdf
pkgver=1.0.2
pkgrel=1
pkgdesc="Command-line tool for diffing pdf files visually or textually"
url="http://www.qtrac.eu/comparepdf.html"
license=('GPL2')
arch=('x86_64')
depends=('poppler-qt5')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/tschoppi/comparepdf/archive/v${pkgver}.tar.gz")
sha512sums=('c72f2ee8c689defc69ccad6750218bcbea3d200e88c868b0a60c1f649587bb22bcdcadee76808e040daf7da578d18757d032b7726d4cc2b9f31d06136d5a8313')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  cmake -D CMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make DESTDIR=${pkgdir} install

  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dpm755 ${_licdir}
  install -Dpm644 LICENSE ${_licdir}/
}

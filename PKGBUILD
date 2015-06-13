# Maintainer: ant32 <antreimer@gmail.com>

pkgname=qcustomplot-qt5
pkgver=1.3.1
pkgrel=1
pkgdesc="Plotting library for Qt5"
url="http://www.qcustomplot.com"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt5-base')
source=("http://www.qcustomplot.com/release/${pkgver}/QCustomPlot-sharedlib.tar.gz"
        "http://www.qcustomplot.com/release/${pkgver}/QCustomPlot-source.tar.gz")
md5sums=('05c3c32a28116b63e09213c8ed2b7055'
         '4448e2e3efbe92ea226fc21a5a1bde55')

build() {
  cd "${srcdir}"

  # fix path to source files
  sed -i 's|../../qcustomplot|../../qcustomplot-source/qcustomplot|g' \
    "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"

  qmake-qt5 "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"
  make release
}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/"{lib,include}
  cp -a libqcustomplot.so* "$pkgdir/usr/lib"
  cp -a qcustomplot-source/qcustomplot.h "${pkgdir}/usr/include"
}

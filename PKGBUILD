# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=qcustomplot-qt5
pkgver=1.3.2
pkgrel=1
pkgdesc="Plotting library for Qt5"
url="http://www.qcustomplot.com"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt5-base')
source=("http://www.qcustomplot.com/release/${pkgver}/QCustomPlot.tar.gz"
        "http://www.qcustomplot.com/release/${pkgver}/QCustomPlot-sharedlib.tar.gz")
md5sums=('a86d447230f7a3966cfbd946f7a3d301'
         '82955a71538b18c23a320047ac32eace')

build() {
  cd "${srcdir}"

  # fix path to source files
  sed -i 's|../../qcustomplot|../../qcustomplot/qcustomplot|g' \
    "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"

  qmake-qt5 "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"
  make release
}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/"{lib,include,share/{qcustomplot,doc/{qt,qcustomplot}}}
  cp -a libqcustomplot.so* "$pkgdir/usr/lib/"
  cp -a qcustomplot/qcustomplot.h "${pkgdir}/usr/include/"
  cp -a qcustomplot/examples "${pkgdir}/usr/share/qcustomplot/"
  cp -a qcustomplot/documentation/html "${pkgdir}/usr/share/doc/qcustomplot/"
  cp -a qcustomplot/documentation/qcustomplot.qch "${pkgdir}/usr/share/doc/qt/"
}

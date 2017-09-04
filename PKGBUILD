# Maintainer: Morten Linderud <morten@linderud.pw>
# Contibutor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=qcustomplot-qt5
pkgver=2.0.0_beta
pkgrel=2
pkgdesc="Plotting library for Qt5"
url="http://www.qcustomplot.com"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt5-base')
source=("QCustomPlot-$pkgver.tar.gz::http://www.qcustomplot.com/release/${pkgver//_/-}/QCustomPlot.tar.gz"
        "QCustomPlot-sharedlib-$pkgver.tar.gz::http://www.qcustomplot.com/release/${pkgver//_/-}/QCustomPlot-sharedlib.tar.gz")
md5sums=('a4196694eb08de800a794cc297e046dd'
         '294fdf8834e8ef0fa2c1e830f936b7fc')

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

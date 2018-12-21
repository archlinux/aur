# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contibutor: Morten Linderud <morten@linderud.pw>
# Contibutor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=qcustomplot-qt5
pkgver=2.0.1
pkgrel=1
pkgdesc="Plotting library for Qt5"
url="http://www.qcustomplot.com"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt5-base')
source=("QCustomPlot-$pkgver.tar.gz::$url/release/${pkgver//_/-}/QCustomPlot.tar.gz"
        "QCustomPlot-sharedlib-$pkgver.tar.gz::$url/release/${pkgver//_/-}/QCustomPlot-sharedlib.tar.gz")
sha256sums=('f23f08b1294fea4c99b90afbd30fef6a85c294e5a6269164e1ee9f57dca9edfd'
            'cca0847dad29beff57b36e21efd1a0c40f74781f4648fb0921fb269d4f61d583')

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

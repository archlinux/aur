# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgbase=python-qcustomplot-pyqt
pkgname=('python-qcustomplot-pyqt5' 'python-qcustomplot-pyqt6')
pkgver=2.1.1.1
pkgrel=1
pkgdesc="Python bindings to QCustomPlot - Qt C++ widget for plotting and data visualization"
arch=('i686' 'x86_64')
url="https://github.com/salsergey/QCustomPlot-PyQt"
license=('MIT' 'GPL3')
makedepends=('sip' 'pyqt-builder' 'python-pyqt5' 'python-pyqt6' 'qcustomplot>=2.1.0')
source=("https://github.com/salsergey/QCustomPlot-PyQt/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha512sums=('68f4bfb7f098dcfa0b7aa038e83277909c5d06d0ea30f44ed32104027b5c5a36c6d31d1061ddb83c694a84f82031783471bf921cfe62edb985817b3d9f84070a')

build() {
  cd "${pkgbase}-${pkgver}"
  sip-build --verbose --no-static-qcustomplot --build-dir build5
  sip-build --verbose --qmake /usr/bin/qmake6 --build-dir build6
}

package_python-qcustomplot-pyqt5() {
  depends=('python-pyqt5' 'qcustomplot>=2.1.0')

  echo "Installing python-qcustomplot-pyqt5 ..."
  cd "${pkgbase}-${pkgver}/build5"
  make INSTALL_ROOT="$pkgdir" install
  cd ..
  install -D -p -m 644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
}

package_python-qcustomplot-pyqt6() {
  depends=('python-pyqt6')

  echo "Installing python-qcustomplot-pyqt6 ..."
  cd "${pkgbase}-${pkgver}/build6"
  make INSTALL_ROOT="$pkgdir" install
  cd ..
  install -D -p -m 644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
}

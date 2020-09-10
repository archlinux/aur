# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=pyside2
_qtver=5.15.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
pkgdesc='Enables the use of Qt5 APIs in Python applications'
depends=(python-shiboken2 qt5-declarative)
makedepends=(shiboken2 cmake
             qt5-multimedia qt5-tools qt5-sensors qt5-charts qt5-webengine qt5-datavis3d
             qt5-websockets qt5-speech qt5-3d qt5-svg qt5-script qt5-scxml qt5-x11extras
             qt5-quickcontrols2 qt5-serialport qt5-remoteobjects)
optdepends=('qt5-svg: QtSvg bindings'
            'qt5-script: QtScript bindings'
            'qt5-speech: QtTextToSpeech bindings'
            'qt5-websockets: QtWebSockets bindings'
            'qt5-webengine: QtWebEngine bindings'
            'qt5-datavis3d: QtDataVisualization bindings'
            'qt5-scxml: QtScxml bindings'
            'qt5-sensors: QtSensors bindings'
            'qt5-3d: Qt3D bindings'
            'qt5-x11extras: QtX11Extras bindings'
            'qt5-charts: QtCharts bindings'
            'qt5-tools: QtHelp bindings'
            'qt5-remoteobjects: QtRemoteObjects bindings'
            'qt5-serialport: QtSerialPort bindings'
            'qt5-quickcontrols2: QtQuickControls2 bindings')
groups=(qt qt5)
conflicts=(python-pyside2)
provides=(python-pyside2 qt5-python-bindings)
replaces=(python-pyside2)
_pkgfqn=pyside-setup-opensource-src-$_qtver
source=("https://download.qt.io/official_releases/QtForPython/pyside2/PySide2-$pkgver-src/${_pkgfqn}.tar.xz")
sha256sums=('f175c1d8813257904cf0efeb58e44f68d53b9916f73adaf9ce19514c0271c3fa')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgfqn}/sources/pyside2 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DPYTHON_EXECUTABLE=/usr/bin/python
  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=python38-pyqt6
pkgname=python38-pyqt6
pkgdesc='A set of Python bindings for the Qt6 toolkit'
pkgver=6.4.0
pkgrel=1
arch=(x86_64)
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(GPL)
groups=(pyqt6)
depends=(qt6-base python38-pyqt6-sip)
optdepends=('qt6-tools: QtHelp, QtDesigner bindings'
            'qt6-svg: QtSvg bindings'
            'qt6-declarative: QtQml bindings, qmlplugin'
            'qt6-quick3d: QtQuick3D bindings'
            'qt6-connectivity: QtBluetooth, QtNfc bindings'
            'qt6-multimedia: QtMultimedia bindings'
            'qt6-positioning: QtPositioning bindings'
            'qt6-remoteobjects: QtRemoteObjects bindings'
            'qt6-sensors: QtSensors bindings'
            'qt6-serialport: QtSerialPort bindings'
            'qt6-speech: QtTextToSpeech bindings'
            'qt6-webchannel: QtWebChannel bindings'
            'qt6-webengine: QtPdf bindings'
            'qt6-websockets: QtWebSockets bindings'
            'python38-dbus: for python-dbus mainloop support')
makedepends=(sip pyqt-builder python38-opengl dbus-python
             qt6-tools qt6-svg qt6-declarative qt6-quick3d qt6-shadertools qt6-multimedia qt6-remoteobjects
             qt6-positioning qt6-sensors qt6-serialport qt6-webchannel qt6-websockets qt6-connectivity qt6-speech qt6-webengine)
source=(https://pypi.python.org/packages/source/P/PyQt6/PyQt6-$pkgver.tar.gz)
sha256sums=('91392469be1f491905fa9e78fa4e4059a89ab616ddf2ecfd525bc1d65c26bb93')
options=(debug)

build() {
  cd PyQt6-$pkgver
  sip-build \
    --confirm-license \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --api-dir /usr/share/qt6/qsci/api/python38 \
    --pep484-pyi
  cd build
  make
}

package_python38-pyqt6(){
  cd PyQt6-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install

  # compile Python bytecode
  python -m compileall -d / "$pkgdir"/usr/lib
  python -O -m compileall -d / "$pkgdir"/usr/lib
}

# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Jan-Erik Meyer-Luetgens <nyan at meyer-luetgens dot de>

pkgname=pyside2-git
pkgver=r7237.d526f801c
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
pkgdesc='Enables the use of Qt5 APIs in Python applications (git version)'
depends=(python-shiboken2 qt5-declarative)
makedepends=(shiboken2 cmake git
             qt5-multimedia qt5-tools qt5-sensors qt5-charts qt5-webengine qt5-datavis3d
             qt5-websockets qt5-speech qt5-3d qt5-svg qt5-script qt5-scxml qt5-x11extras
             qt5-quickcontrols2 qt5-serialport qt5-remoteobjects qt5-xmlpatterns)
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
conflicts=(python-pyside2 pyside2)
provides=(python-pyside2 pyside2)
source=("$pkgname::git+https://code.qt.io/pyside/pyside-setup.git#branch=5.15")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}/build"

  cmake ../sources/pyside2 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DPYTHON_EXECUTABLE=/usr/bin/python
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"

  make DESTDIR="${pkgdir}" install
}

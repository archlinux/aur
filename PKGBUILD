# Maintainer: quest <quest@mac.com>

pkgname='electron-cash-slp'
pkgdesc='Lightweight Bitcoin Cash wallet with SLP support'
pkgver=3.6.7
pkgrel=0
url='https://github.com/simpleledger/Electron-Cash-SLP/'
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'protobuf'
  'python-requests'
  'python-setuptools'
  'python-tox'
)
depends=(
  'hicolor-icon-theme'
  'python'
  'python-dnspython'
  'python-ecdsa'
  'python-jsonrpclib-pelix'
  'python-protobuf'
  'python-pyaes'
  'python-pyqt5'
  'python-pysocks'
  'python-qrcode'
  'python-requests'
  'python-six'
  'qt5-base'
)
optdepends=(
  'desktop-file-utils: update desktop icon'
  'gtk-update-icon-cache: update desktop icon'
  'python-btchip: Ledger hardware wallet support'
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python-matplotlib: plot transaction history in graphical mode'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'xdg-utils: update desktop icon'
  'zbar: QR code reading support'
)
provides=("electron-cash")
conflicts=("electron-cash")
source=("https://github.com/simpleledger/Electron-Cash-SLP/archive/refs/tags/${pkgver}-dev6.tar.gz")
sha256sums=('e68b2a78210b57edafdea7144f3a47f02343d8bc9f44fea503814d883db23e3d')

build() {
  cd "Electron-Cash-SLP-${pkgver}-dev6"

  # python2-pyqt5 and qt5-base are needed for _only_ the icons...

  # Compile the icons file for Qt:
  mkdir -p gui/qt
  pyrcc5 icons.qrc -o gui/qt/icons_rc.py
  # Create translations (optional):
  python contrib/make_locale
  # Build
  python setup.py build
}

check() {
  cd "Electron-Cash-SLP-${pkgver}-dev6"

  tox -e py39
}

package() {
  cd "Electron-Cash-SLP-${pkgver}-dev6"

  python setup.py install --root="${pkgdir}" --optimize=1
}

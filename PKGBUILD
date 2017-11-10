# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>

#
# ThomasV PGP key: gpg --recv-key 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6
# http://bitcoin-otc.com/viewgpg.php?nick=ThomasV
#

pkgname='electron-cash'
pkgdesc='Lightweight Bitcoin Cash wallet'
pkgver=2.9.4
pkgrel=1
url='http://www.electroncash.org/'
install="${pkgname}.install"
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'protobuf'
  'python2-pycurl'
  'python2-setuptools'
  'python2-tox'
)
depends=(
  'hicolor-icon-theme'
  'python2'
  'python2-dnspython'
  'python2-ecdsa'
  'python2-jsonrpclib-pelix'
  'python2-pbkdf2'
  'python2-protobuf'
  'python2-pyaes'
  'python2-pyqt5'
  'python2-pysocks'
  'python2-qrcode'
  'python2-requests'
  'python2-six'
  'qt5-base'
)
optdepends=(
  'desktop-file-utils: update desktop icon'
  'gtk-update-icon-cache: update desktop icon'
  'python2-amodem: air-gapped transaction signing over audio modem'
  'python2-btchip: Ledger hardware wallet support'
  'python2-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python2-keepkey: KeepKey hardware wallet support'
  'python2-matplotlib: plot transaction history in graphical mode'
  'python2-rpyc: send commands to Electrum Python console from an external script'
  'python2-trezor: Trezor hardware wallet support'
  'xdg-utils: update desktop icon'
  'zbar: QR code reading support'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fyookball/electrum/archive/${pkgver}.tar.gz")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://electroncash.org/downloads/2.9.4/win-linux/Electron-Cash-2.9.4.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.sig"
)
#https://raw.githubusercontent.com/fyookball/keys-n-hashes/master/pubkeys/jonaldkey2.txt
validgpgkeys=('4FD06489EFF1DDE1')
sha256sums=(
  '70939028e5cf9401ab2fdf7cb760e58264cba260a4729128911fad6514ff15f9'
  '39a43abed8b8d4d385d651dcf0b15086a77755a91821eb89d462827f75c66cac'
)

build() {
  #cd "${pkgname/on-cash/um}-${pkgver}"
  cd "Electron Cash-${pkgver}"

  # Compile the icons file for Qt:
  python2-pyrcc5 icons.qrc -o gui/qt/icons_rc.py
#  # Compile the protobuf description file:
#  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto
#  # Create translations (optional):
#  python2 contrib/make_locale
  # Build
  python2 setup.py build
}

#check() {
#  #cd "${pkgname/on-cash/um}-${pkgver}"
#  cd "Electron Cash-${pkgver}"
#
#  tox2
#}

package() {
  #cd "${pkgname/on-cash/um}-${pkgver}"
  cd "Electron Cash-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}


# vim: ts=2 sw=2 et:

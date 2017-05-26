# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum-dash
_pkgname=Electrum-DASH
pkgver=2.6.4
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet, fork for DASH"
arch=('any')
depends=(
    'python2-slowaes'
    'python2-ecdsa'
    'python2-pbkdf2'
    'python2-requests'
    'python2-qrcode'
    'python2-protobuf'
    'python2-dnspython'
    'python2-jsonrpclib'
    'python2-trezor'
    'python2-x11_hash'
    'python2-pyqt4'
    # 'python2-pysocks'
    # 'python2-pycryptodomex'
)
makedepends=(
    'python2-pyqt4'
    # 'gettext'
    # 'python2-setuptools'
    # 'desktop-file-utils'
)
optdepends=(
    'python2-btchip: BTChip hardware wallet support'
    'python2-matplotlib: plot transaction history in graphical mode'
    'zbar: QR code reading support'
)
url="https://electrum-dash.org"
license=(MIT)
source=("${pkgname}-${pkgver}.tar.gz::https://electrum-dash.org/download/${pkgver}/Electrum-DASH-${pkgver}.tar.gz")
sha256sums=('f8e1c9188e425ea4740125ba931b2ce034a97eaa3b37e4b589a22db8486a231b')

prepare() {
  cd ${_pkgname}-${pkgver}

  find . -type f -exec sed -i 's#/usr/bin/python$#/usr/bin/python2#g' {} +
  find . -type f -exec sed -i 's#/usr/bin/env python$#/usr/bin/env python2#g' {} +
}

build() {
  cd ${_pkgname}-${pkgver}

  pyrcc4 icons.qrc -o gui/qt/icons_rc.py
  python2 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

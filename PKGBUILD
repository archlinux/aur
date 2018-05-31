# Maintainer: Daniel Case <daniel@dashlabs.org>
# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum-dash
_pkgname=Electrum-DASH
pkgver=3.0.6.3
pkgrel=3
pkgdesc="Lightweight Bitcoin wallet, fork for DASH"
arch=('any')
depends=(
    'python-pyaes'
    'python-ecdsa'
    'python-pbkdf2'
    'python-requests'
    'python-qrcode'
    'python-protobuf'
    'python-dnspython'
    'python-jsonrpclib-pelix'
    'python-trezor'
    'python-btchip'
    'python-x11_hash'
    'python-pyqt4'
    # 'python2-pysocks'
    # 'python2-pycryptodomex'
)
makedepends=(
    'python-pyqt4'
    # 'gettext'
    # 'python2-setuptools'
    # 'desktop-file-utils'
)
optdepends=(
    'python-matplotlib: plot transaction history in graphical mode'
    'zbar: QR code reading support'
)
url="https://electrum-dash.org"
license=(MIT)
source=("https://github.com/akhavr/electrum-dash/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('45314890f229d0959b28fcb35d57d8d3416bf26c683bb629dec340fe6cb35105')

prepare() {
  cd ${_pkgname}-${pkgver}

  find . -type f -exec sed -i 's#/usr/bin/python$#/usr/bin/python3#g' {} +
  find . -type f -exec sed -i 's#/usr/bin/env python$#/usr/bin/env python3#g' {} +
}

build() {
  cd ${_pkgname}-${pkgver}

  pyrcc5 icons.qrc -o gui/qt/icons_rc.py
  python3 setup.py build
}

package() {
  ls -lah
  cd ${_pkgname}-${pkgver}

  python3 setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Angel Perez <near1297@nauta.cu>
# Maintainer: Daniel Case <daniel@dashlabs.org>
# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum-dash
_pkgname=Dash-Electrum
pkgver=3.3.8.6
pkgrel=1
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
sha256sums=('71d0387a208bc45eeec08a7c779993ff841562613b11f6107f79e540dc1f7282')

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

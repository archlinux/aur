# Maintainer: Marcel O'Neil <marcel@marceloneil.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=electrum
pkgdesc="Lightweight Bitcoin wallet"
pkgver=3.3.4
pkgrel=1
url="https://electrum.org"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-aiohttp'
  'python-aiohttp-socks'
  'python-aiorpcx'
  'python-certifi'
  'python-dnspython'
  'python-ecdsa'
  'python-jsonrpclib-pelix'
  'python-pbkdf2'
  'python-protobuf'
  'python-pyaes'
  'python-pycryptodomex'
  'python-pyqt5'
  'python-pysocks'
  'python-qrcode'
  'python-requests'
  'python-websocket-client'
)
optdepends=(
  'python-btchip: Ledger hardware wallet support'
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-matplotlib: plot transaction history in graphical mode'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python-qdarkstyle: optional dark theme in graphical mode'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'zbar: QR code reading support'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://download.electrum.org/${pkgver}/${pkgname^}-${pkgver}.tar.gz"{,.asc})
sha512sums=('297eb757dccb166d40a652be2c1c058e42f16416b586b69f32223966ff1e92a34e5d01822d71bd063bfa72b7bbbcae4251a63f7373600d0eeb139e923d17a2b3'
            'SKIP')
validpgpkeys=('6694D8DE7BE8EE5631BED9502BD5824B7F9470E6')

build() {
  cd "${pkgname^}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname^}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENCE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# Maintainer: Musee "lae" Ullah <lae(at)idolactiviti(dot)es>
pkgname=electrum-mona
pkgver=4.1.4
pkgrel=1
pkgdesc="A lightweight Monacoin wallet"
arch=('any')
url='https://github.com/wakiyamap/electrum-mona'
license=('MIT')
depends=('python-pyaes' 'python-ecdsa' 'python-pbkdf2' 'python-requests' 'python-qrcode'
         'python-protobuf' 'python-dnspython' 'python-jsonrpclib-pelix' 'python-pysocks'
         'python-pyqt5' 'python-pycryptodomex' 'python-websocket-client' 'python-certifi'
         'python-aiorpcx' 'python-aiohttp' 'python-aiohttp-socks'
         'libsecp256k1' 'python-bitstring' 'python-lyra2re_hash' 'gettext')
optdepends=('python-btchip: BTChip hardware wallet support'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'zbar: QR code reading support'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'python-qdarkstyle: optional dark theme in graphical mode'
            'python-trezor: for Trezor hardware support'
            'python-keepkey: for KeepKey hardware support')
makedepends=('python-pycurl' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e66e5fdf68f54e0e16ece07746ab40c6ce0b49430f96fdc55a92cfaf0084d29fde0089bfda3c47c0262d941db40bc71792b70883b3655258af8d5437bff1508e')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  python setup.py build
  python contrib/pull_locale
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  export PYTHONHASHSEED=0
  python setup.py install -O1 --root=${pkgdir}/

  mv ${pkgdir}/usr/share/pixmaps/electrum{,-mona}.png
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}

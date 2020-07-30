# Maintainer: Musee "lae" Ullah <lae(at)idolactiviti(dot)es>
pkgname=electrum-mona
pkgver=4.0.2
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
optdepends=('python-matplotlib: for plot history'
            'python-trezor: for Trezor hardware support'
            'python-btchip: for BTChip hardware support'
            'python-keepkey: for KeepKey hardware support')
makedepends=('python-pycurl' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c4d883317c0af0f86fcebca8124b1d5399bfdc34e3516ed6ad3ca6e3c9d5a5cd4620f1928e8ca0e3cde4bb7677fa1b7f719ee533f7bdf4ff27f2b6fb05158bad')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  ./setup.py build
  ./contrib/pull_locale
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  ./setup.py install -O1 --root=${pkgdir}/

  mv ${pkgdir}/usr/share/pixmaps/electrum{,-mona}.png
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}

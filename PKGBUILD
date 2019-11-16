# Maintainer: Musee "lae" Ullah <lae(at)idolactiviti(dot)es>
pkgname=electrum-mona
pkgver=3.3.8
pkgrel=1
pkgdesc="A lightweight Monacoin wallet"
arch=('any')
url='https://github.com/wakiyamap/electrum-mona'
license=('MIT')
depends=('cython'
         'python-pyaes'
         'python-ecdsa'
         'python-pbkdf2'
         'python-requests'
         'python-qrcode'
         'python-lyra2re_hash'
         'python-protobuf'
         'python-dnspython'
         'python-jsonrpclib-pelix'
         'python-pysocks'
         'python-pyqt5'
         'python-certifi'
         'python-pycryptodomex'
         'python-websocket-client'
         'python-aiorpcx'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-async-timeout'
         'python-multidict'
         'python-yarl'
         'gettext'
)
optdepends=('python-matplotlib: for plot history'
            'python-trezor: for Trezor hardware support'
            'python-btchip: for BTChip hardware support'
            'python-keepkey: for KeepKey hardware support')
makedepends=('python-pycurl' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('90f08f771122bb6ead38475765fe1407d6e1a1223fa634242fb20f99ee8bb93e721a5936af04823553856b298ec7d8a21de0439c41a668778f86f43c6a453c6d')

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

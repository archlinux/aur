# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>
pkgname=electrum-mona
pkgver=3.3.4
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
         'gettext'
)
optdepends=('python-matplotlib: for plot history'
            'python-trezor: for Trezor hardware support'
            'python-btchip: for BTChip hardware support'
            'python-keepkey: for KeepKey hardware support')
makedepends=('python-pycurl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c79d34a77c77f2d267ecf3127065ae8b8d01d9390700637bf255cc14826e6f6a12095921746de788a3b46f2e3adebc7173e1629e96d9d2f56c63785d101d3574')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  ./setup.py build
  ./contrib/make_locale
  ./contrib/make_packages
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  ./setup.py install -O1 --root=${pkgdir}/

  mv ${pkgdir}/usr/share/pixmaps/electrum{,-mona}.png
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}

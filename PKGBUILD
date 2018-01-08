# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>
pkgname=electrum-mona
pkgver=3.0.5
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
         'gettext'
)
optdepends=('python-matplotlib: for plot history')
makedepends=('python-pycurl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4f5d4506a980415e8c8a63f5c871d5f9c4ab3bf1d7c87f778cce3d9413f19f200e8b16ff17c953d863377a3322eb7a653db4ac186414226a1949ec93e3427a76')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  pyrcc5 icons.qrc -o gui/qt/icons_rc.py
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  ./setup.py build
  ./contrib/make_locale
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  ./setup.py install -O1 --root=${pkgdir}/

  mv ${pkgdir}/usr/share/pixmaps/electrum{,-mona}.png
  install -Dm644 electrum-mona.conf.sample ${pkgdir}/usr/share/doc/electrum-mona/examples/electrum-mona.conf
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}

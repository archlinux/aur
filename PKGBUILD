# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>
pkgname=electrum-mona
pkgver=3.0.4
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
sha512sums=('160022eabd506f423991dfffcaf779b072b506ccd9b346820f067e25e11a0255afbebbcf3f3f38d8aae0363907cf0e04e1f4b9fdaa885d3082a839dd2d7f0cd0')

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

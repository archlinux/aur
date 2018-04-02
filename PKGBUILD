# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>
pkgname=electrum-mona
pkgver=3.1.2
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
         'gettext'
)
optdepends=('python-matplotlib: for plot history'
            'python-trezor: for Trezor hardware support'
            'python-btchip: for BTChip hardware support'
            'python-keepkey: for KeepKey hardware support')
makedepends=('python-pycurl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7ce6bd4c94697d8bd2807432bad7d0887b0bf5240df9ec9bcd0d82e40737c92c8d56428d4719a7f7d02c4a64558883842ff1aff4aa34e47e8733d593b369940f')

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

pkgname=electrum-ltc
pkgver=3.0.6.1
pkgrel=1
pkgdesc='Lightweight Litecoin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(python-dnspython
         python-ecdsa
         python-jsonrpclib-pelix
         python-matplotlib
         python-pbkdf2
         python-protobuf
         python-pyaes
         python-pycryptodomex
         python-pyqt5
         python-pysocks
         python-qrcode
         python-requests
         python-scrypt
         zbar)
source=(
  "electrum-ltc-$pkgver.tar.gz::https://codeload.github.com/pooler/electrum-ltc/tar.gz/$pkgver"
)
sha256sums=(9f219dc570f6a94374e92d36c7a9e0b7ce2dadc4345b2c0e415688aea23ba6ce)

build() {
  cd electrum-ltc-$pkgver/
  pyrcc5 icons.qrc >gui/qt/icons_rc.py
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto
  contrib/make_locale
  ./setup.py build
}

package() {
  cd electrum-ltc-$pkgver/

  ./setup.py install -O1 --root="$pkgdir"/

  mkdir -p "$pkgdir"/usr/share/doc/electrum-ltc/
  cp AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample "$pkgdir"/usr/share/doc/electrum-ltc/

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  cp LICENCE "$pkgdir"/usr/share/licenses/$pkgname/
}

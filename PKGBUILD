pkgname=electrum-ltc
pkgver=3.0.6.2
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
source=("https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz"{,.asc})
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
sha256sums=(4745ca28b8e0faa7f6a227696b09d2a9305f8ad42959242f52ba5b35dd265ead
            SKIP)

build() {
  cd Electrum-LTC-$pkgver/
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver/

  ./setup.py install -O1 --root="$pkgdir"/

  mkdir -p "$pkgdir"/usr/share/doc/electrum-ltc/
  cp AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample "$pkgdir"/usr/share/doc/electrum-ltc/

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  cp LICENCE "$pkgdir"/usr/share/licenses/$pkgname/
}

pkgname=electrum-ltc
pkgver=3.1.2.1
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
sha256sums=(06c55cd308fc9605f4a698bcfd21a98a4f48e6a853b79f0349fe8e8726a1b869
            SKIP)

build() {
  cd Electrum-LTC-$pkgver
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver

  ./setup.py install -O1 --root="$pkgdir"

  install -Dm644 AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample \
          -t "$pkgdir"/usr/share/doc/electrum-ltc

  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}

pkgname=electrum-ltc
pkgver=3.1.3.1
pkgrel=3
pkgdesc='Lightweight Litecoin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(desktop-file-utils
         python-btchip
         python-dnspython
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
         python-websocket-client
         zbar)
source=("https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz"{,.asc})
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
sha256sums=(27d272f01584aeddf1a3268f6f2c18d9557ba7376d203241473f41e37ae8ac4f
            SKIP)

prepare() {
  sed -i Electrum-LTC-$pkgver/electrum-ltc.desktop \
      -e 's/Exec=.*electrum-ltc %u.*/Exec=electrum-ltc %u/' \
      -e 's/Exec=.*electrum-ltc --testnet %u.*/Exec=electrum-ltc --testnet %u/'
}

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

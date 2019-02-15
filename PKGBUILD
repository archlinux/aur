pkgname=electrum-ltc
pkgver=3.3.4.1
pkgrel=1
pkgdesc='Litecoin thin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(desktop-file-utils
         libsecp256k1
         python-aiohttp
         python-aiohttp-socks
         python-aiorpcx
         python-btchip
         python-certifi
         python-dnspython
         python-ecdsa
         python-jsonrpclib-pelix
         python-matplotlib
         python-protobuf
         python-pyaes
         python-pycryptodomex
         python-pyqt5
         python-qrcode
         python-scrypt
         python-websocket-client
         zbar)
source=("https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz"{,.asc})
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
sha256sums=(62227ed18eb683975871318fd682f20687d0e42d74f350d510cff9745fb64a6a
            SKIP)

prepare() {
  sed -E 's/sh.*(electrum.*)"/\1/' -i Electrum-LTC-$pkgver/electrum-ltc.desktop
}

build() {
  cd Electrum-LTC-$pkgver
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver
  ./setup.py install -O1 --root="$pkgdir" --skip-build
  install -Dm644 AUTHORS README.rst RELEASE-NOTES -t "$pkgdir"/usr/share/doc/electrum-ltc
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}

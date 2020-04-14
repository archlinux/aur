pkgname=electrum-ltc
pkgver=3.3.8.1
pkgrel=1
pkgdesc='Litecoin thin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(
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
  python-qdarkstyle
  python-qrcode
  python-scrypt
  python-websocket-client
  zbar
)
source=(https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz{,.asc})
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
b2sums=(
  481530e09570a624d8419fa2265139c95d911c941ca57393b3d4fff9a44446c90fd52fec4642648b641b6ca17bccee19acb50a92f98c023ce247a94f201f564c
  SKIP
)

prepare() {
  sed -i -r 's/sh.*(electrum.*)"/\1/' Electrum-LTC-$pkgver/electrum-ltc.desktop
}

build() {
  cd Electrum-LTC-$pkgver
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver
  ./setup.py install -O1 --root="$pkgdir" --skip-build
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}

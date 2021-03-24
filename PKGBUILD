pkgname=electrum-ltc
pkgver=4.0.9.3
pkgrel=1
pkgdesc='Litecoin wallet'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(
  libsecp256k1
  python-aiohttp
  python-aiohttp-socks
  python-aiorpcx
  python-bitstring
  python-btchip
  python-certifi
  python-cryptography
  python-dnspython
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
  d8eda2557416aeda0767f0b77530069beb46a9410e43618bd22e9f53815a7cac9d81668ca5be6271bd5dd0e9c57190c94085582aa83a231388b1ac2ef670c8c5
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
  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}

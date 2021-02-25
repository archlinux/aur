pkgname=electrum-ltc
pkgver=4.0.9.2
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
makedepends=(python-requests)
source=(https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz{,.asc})
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
b2sums=(
  b16b32ce554be66700074418e5c139e2152b79f0c84d312940aa4915a3d16f6a3ea490810060db97b32e1f0fcb72c29012260304e1bcaef75f392fe9f2e9b680
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

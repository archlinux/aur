pkgname=electrum-ltc
pkgver=4.2.2.1
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
  python-certifi
  python-cryptography
  python-dnspython
  python-protobuf
  python-pyqt5
  python-qdarkstyle
  python-qrcode
  python-scrypt
  zbar
)
makedepends=(python-setuptools)
source=(https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz{,.asc})
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
b2sums=(
  77a3f3969d435492216fa93afe48228bec1e3897d83eb5ebce5aee7088304ae54ceeeb030c6250a761a1f5c02abe554bc5e38c055b9979c1b390304a2f4a0966
  SKIP
)

prepare() {
  sed -i -r 's/sh.+(electrum.+)"/\1/' Electrum-LTC-$pkgver/electrum-ltc.desktop
}

build() {
  cd Electrum-LTC-$pkgver
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver
  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENCE
}

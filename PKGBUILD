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
  python-btchip
  python-certifi
  python-cryptography
  python-dnspython
  python-jsonrpclib-pelix
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
makedepends=(python-setuptools)
source=(electrum-ltc-$pkgver.tar.gz::https://codeload.github.com/pooler/electrum-ltc/tar.gz/refs/tags/$pkgver)
b2sums=(b3327f6bcf23b5caca6196e380e62f154a9f56a5b636a8d0cc49e08ed0ab5a05b4b1a81d9869b92125526339924ccb9b555a704eb7fa98bce59eac6088c7ebfe)

prepare() {
  sed -i -r 's/sh.*(electrum.*)"/\1/' electrum-ltc-$pkgver/electrum-ltc.desktop
}

build() {
  cd electrum-ltc-$pkgver
  contrib/pull_locale
  ./setup.py build
}

package() {
  cd electrum-ltc-$pkgver
  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}

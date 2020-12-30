pkgname=electrum-ltc
pkgver=4.0.9.1
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
source=(electrum-ltc-$pkgver.tar.gz::https://codeload.github.com/pooler/electrum-ltc/tar.gz/$pkgver)
b2sums=(2c328f9fc433f39b11aa2bfc4e397b75aadd07adc66576ae985c5b41b32d663df80bb67dafbbce210f3581f6fb43e666070d090bf189eb4907efd07d306fc945)

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

pkgname=qtum-electrum
pkgver=0.18.16
pkgrel=3
pkgdesc='Qtum thin client'
arch=(any)
url=https://qtum.org/
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
	     python-eth-hash
	     python-pycryptodome
	     python-pysha3
	     python-eth-utils
	     python2-packaging
	     python-cytoolz
	     python2-appdirs
	     python2-pyparsing
	     python2-six
	     python2-packaging
	     python2-setuptools
	     cython
	     cython2
	     python-eth-typing
	     python-toolz
	     python-cytoolz
	     python-eth-utils
	     python-requests
	     python-pip
	     python-socks	     
	     zbar)
source=("https://github.com/qtumproject/qtum-electrum/archive/v$pkgver.tar.gz")
sha256sums=(b63e5c50854453614d61e26b0d3e0882a54ece38d8aecc0c40596efce40f31e0)



build() {
  cd qtum-electrum-$pkgver
  ./setup.py build
  sudo pip install eth_abi
}

package() {
  cd qtum-electrum-$pkgver
  ./setup.py install -O1 --root="$pkgdir" --skip-build
  install -Dm755 "$pkgdir/"/usr/bin/run_qtum_electrum "$pkgdir/"/usr/bin/qtum-electrum
  install -Dm755 "$srcdir/"qtum-electrum-$pkgver/qtum-electrum.desktop "$pkgdir"/usr/share/applications/
  install -Dm755 "$pkgdir/"/usr/share/pixmaps/electrum.png "$pkgdir/"/usr/share/pixmaps/qtumelectrum.png
  rm "$pkgdir/"/usr/share/pixmaps/electrum.png
  rm "$pkgdir/"/usr/bin/run_qtum_electrum

}

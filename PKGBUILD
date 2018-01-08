pkgname=electrum-ltc
pkgver=3.0.5.1
pkgrel=1
pkgdesc="Lightweight Litecoin client"
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
source=(https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz
        https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz.asc)
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
sha256sums=(79189a3f8a42bbde69b967141cd733d90d114eacc3705714349f0dd4ea7f9aa9
            SKIP)

build() {
  cd Electrum-LTC-$pkgver/
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver/

  ./setup.py install -O1 --root=$pkgdir/

  mkdir -p $pkgdir/usr/share/doc/electrum-ltc/
  cp AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample $pkgdir/usr/share/doc/electrum-ltc/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp LICENCE $pkgdir/usr/share/licenses/$pkgname/
}

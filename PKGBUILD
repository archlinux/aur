pkgname=electrum-cash
pkgver=2.9.3
pkgrel=1
pkgdesc="Lightweight Bitcoin Cash wallet"
arch=('any')
depends=(
  'python2-pyaes' 
  'python2-ecdsa' 
  'python2-pbkdf2' 
  'python2-requests' 
  'python2-qrcode'
  'python2-protobuf' 
  'python2-dnspython' 
  'python2-jsonrpclib' 
  'python2-pysocks'
  'python2-pyqt4' 
  'python2-pycryptodomex'
)
makedepends=(
  'gettext' 
  'python2-setuptools' 
  'desktop-file-utils'
)
optdepends=(
  'python2-btchip: BTChip hardware wallet support'
  'python2-matplotlib: plot transaction history in graphical mode'
  'zbar: QR code reading support'
)
url="https://electroncash.org"
license=(MIT)
source=(
  "https://electroncash.org/downloads/${pkgver}/win-linux/Electron-Cash-${pkgver}.tar.gz"
  "https://github.com/fyookball/keys-n-hashes/raw/master/sigs-and-sums/${pkgver}/win-linux/Electron-Cash-${pkgver}.tar.gz.sig"
)
sha1sums=(
  '14c5ace99c1ffd5f9e33b27fc1735ce9a6875796'
  'SKIP'
)
validpgpkeys=(
  "C885059AAD1EEB999C73AFCF9F9DCF0B14FE144D"
)

prepare() {
  cd Electron\ Cash-${pkgver}

  find . -type f -exec sed -i 's#/usr/bin/python$#/usr/bin/python2#g' {} +
  find . -type f -exec sed -i 's#/usr/bin/env python$#/usr/bin/env python2#g' {} +
}

build() {
  cd Electron\ Cash-${pkgver}

  pyrcc4 icons.qrc -o gui/qt/icons_rc.py
  python2 setup.py build
}

package() {
  cd Electron\ Cash-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

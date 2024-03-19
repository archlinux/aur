# Maintainer: groestlcoin <groestlcoin@gmail.com>

pkgname=electrum-grs
pkgver=4.5.4
pkgrel=1
pkgdesc="Lightweight Groestlcoin wallet"
arch=('any')
url="https://github.com/groestlcoin/electrum-grs"
license=('MIT')
depends=('hicolor-icon-theme'
         'libsecp256k1'
         'python'
         'python-ecdsa'
         'python-qrcode'
         'python-protobuf'
         'python-dnspython'
         'python-qdarkstyle'
         'python-aiorpcx-git>=0.22'
         'python-aiorpcx-git<0.23'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-certifi'
         'python-bitstring'
         'python-attrs'
         'python-jsonpatch'
         'python-cryptography'
         'python-requests'
         'python-six'
         'python-pyqt5'
         'qt5-base'
         'python-groestlcoin_hash')
makedepends=('gettext'
             'git'
             'protobuf'
             'python-pycurl'
             'python-setuptools')
optdepends=('desktop-file-utils: update desktop icon'
            'gtk-update-icon-cache: update desktop icon'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-trezor: Trezor hardware wallet support'
            'python-safet: Archos Safe-T hardware wallet support'
            'python-keepkey: KeepKey hardware wallet support'
            'python-btchip: Ledger hardware wallet support'
            'python-ckcc-protocol: Coldcard wallet hardware support'
            'python-bitbox02: BitBox wallet hardware support'
            'python-cbor: Blockstream Jade hardware wallet communication'
            'python-pyserial: Blockstream Jade hardware wallet serial port extension'
            'python-matplotlib: plot transaction history in graphical mode'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'xdg-utils: update desktop icon'
            'python-amodem: air-gapped transaction signing over audio modem'
            'zbar: QR code reading support')
source=("https://github.com/Groestlcoin/electrum-grs/releases/download/v${pkgver}/Electrum-grs-${pkgver}.tar.gz"
        "Electrum-grs-${pkgver}.tar.gz.asc::https://github.com/Groestlcoin/electrum-grs/releases/download/v${pkgver}/Electrum-grs-${pkgver}.tar.gz.asc")
sha256sums=('2b93e3a97bc05bca189021b2c446079b800753001cd8e771ee19b2e907ce39f8'
            'f90f9190e476c49a14893ba9c885ef7f6ee824de72b9d1f308ace61c28b85f33')
validpgpkeys=('287AE4CA1187C68C08B49CB2D11BD4F33F1DB499')
install=electrum-grs.install

prepare() {
  cd "Electrum-grs-${pkgver}"

  echo 'Compiling protobuf description file...'
  protoc \
    --proto_path=electrum_grs \
    --python_out=electrum_grs \
    electrum_grs/paymentrequest.proto
}

build() {
  cd "Electrum-grs-${pkgver}"

  echo 'Building...'
  python setup.py build
}

package() {
  cd "Electrum-grs-${pkgver}"

  echo 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 AUTHORS README.md RELEASE-NOTES -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}

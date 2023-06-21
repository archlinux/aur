# Maintainer: groestlcoin <groestlcoin@gmail.com>

pkgname=electrum-grs
pkgver=4.4.4
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
         'python-aiorpcx'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-certifi'
         'python-bitstring'
         'python-attrs'
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
sha256sums=('b06940020b8e85322f2eb02876ea43cf772f4eec8479064c867b8ab3c5b0194a'
            '173983c31d821467dbb3f3e51feda0767abbb6a5150c94fbc54b4fe24f690ca8')
validpgpkeys=('287AE4CA1187C68C08B49CB2D11BD4F33F1DB499')
install=electrum-grs.install

build() {
  cd "Electrum-grs-${pkgver}"

  echo 'Compiling protobuf description file...'
  protoc \
    --proto_path=electrum_grs \
    --python_out=electrum_grs \
    electrum_grs/paymentrequest.proto

  echo 'Building...'
  python setup.py build
}

package() {
  cd "Electrum-grs-${pkgver}"

  echo 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 AUTHORS README.rst RELEASE-NOTES -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}

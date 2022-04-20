# Maintainer:   vertion                  <vertion@protonmail.com>
# Contributor:  vertion                  <vertion@protonmail.com>
# Contributor:  James Lovejoy            <$(echo "amFtZXNsb3Zlam95MUBnbWFpbC5jb20=" | base64 -d)>
# Contributor:  The Vertcoin Developers  <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>
# Contributor:  Thomas Voegtlin          <$(echo "dGhvbWFzdkBlbGVjdHJ1bS5vcmcK" | base64 -d)>
# Contributor:  Pooler                   <https://bitcointalk.org/index.php?action=profile;u=43931>

pkgname=electrum-vtc
pkgver=4.2.1
pkgrel=1
pkgdesc='Lightweight Vertcoin wallet'
arch=('any')
url='https://vertcoin.org/'
license=('MIT')

makedepends=('python-setuptools' 'python-pip')
depends=('python-pyaes' 'python-ecdsa' 'python-pbkdf2' 'python-requests' 'python-qrcode'
         'python-protobuf' 'python-dnspython' 'python-jsonrpclib-pelix' 'python-pysocks'
         'python-pyqt5' 'python-pycryptodomex' 'python-websocket-client' 'python-certifi'
         'python-aiorpcx' 'python-aiohttp' 'python-aiohttp-socks'
         'libsecp256k1' 'python-bitstring'
         )
optdepends=('python-btchip: BTChip hardware wallet support'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'zbar: QR code reading support'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'python-qdarkstyle: optional dark theme in graphical mode'
            'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
            'create-verthash-datafile: generate verthash.dat'
            )

source=("https://github.com/vertcoin-project/electrum/releases/download/v${pkgver}/Electrum-VTC-v${pkgver}.tar.gz")
sha256sums=('10628f93fb126b358481d797480654aaebc0ea7a202da1d6b8dbd1c4e127d764')
provides=('electrum-vtc')
conflicts=('electrum-vtc')

build() {
    cd "Electrum-VTC-${pkgver}"
    python setup.py build
    pip install vertcoinhash
}

package() {
    cd "Electrum-VTC-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 AUTHORS README.rst RELEASE-NOTES -t "$pkgdir"/usr/share/doc/$pkgname
    install -D -m644 LICENCE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
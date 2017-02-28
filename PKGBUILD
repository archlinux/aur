# Maintainer: M0Rf30

pkgname=encompass
pkgver=0.5.0
pkgrel=1
pkgdesc="BIP-0044 compliant multi-currency wallet based on Electrum. Extendable with ChainKey modules to most coins!"
arch=('any')
depends=('python2-ecdsa' 'python2-pbkdf2' 'python2-requests' 'python2-pyasn1' 'python2-pyasn1-modules' 'python2-qrcode' 'python2-ltc_scrypt' 
	 'python2-darkcoin_hash' 'python2-mnemonic' 'python2-hidapi' 'python2-socks' 'python2-protobuf' 'python2-tlslite' 'python2-dnspython'
	 'python2-pyqt4' 'python2-sip' 'python2-slowaes' 'python2-trezor')
makedepends=('gettext' 'python2-pycurl' 'python2-setuptools' 'desktop-file-utils')
optdepends=('python2-btchip: BTChip hardware wallet support'
            'python2-matplotlib: plot transaction history in graphical mode'
            'zbar: QR code reading support')
url="https://github.com/mazaclub/encompass/"
license=('GPL3')
source=("https://github.com/mazaclub/encompass/releases/download/v{$pkgver}/${pkgname^}-${pkgver}.tar.gz")
provides=('encompass')
install=encompass.install

prepare() {
  cd ${pkgname^}-${pkgver}

  find . -type f -exec sed -i 's#/usr/bin/python#/usr/bin/python2#g' {} +
  find . -type f -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#g' {} +
}

build() {
  cd ${pkgname^}-${pkgver}

  pyrcc4 icons.qrc -o gui/qt/icons_rc.py
  python2 setup.py build
}

package() {
  cd ${pkgname^}-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('49d7a12cf337ae22da9bfd7a513e4a1a')

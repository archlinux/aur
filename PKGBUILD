# Maintainer: bitcoinlizard <bitcoinlizard@fastmail.com>

pkgname=specter-desktop
pkgver=1.3.1
pkgrel=1
pkgdesc="Specter Desktop functions as a watch-only coordinator for multi- signature and single-key Bitcoin wallets."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'libusb' 'systemd-libs' 'python-dotenv' 'python-flask' 'python-flask-login' 'python-flask-wtf' 'python-mnemonic' 'python-hwilib' 'python-embit' 'python-flask-cors' 'python-pgpy' 'python-pyopenssl' 'python-stem' 'python-typing_extensions' 'python-psutil' 'python-hidapi' 'python-ecdsa' 'python-protobuf' 'python-importlib-metadata')

source=("https://github.com/cryptoadvance/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'specter.service')
sha512sums=('c0aa9fe9088160b0275cc713d024f906c63c2fbc22458cb729efcd2c7b5c6c4b746a80cb24be34962054283ac70bd44d8a9b314071c911c924eb79fa7210b073'
            '2225d9b70c01c0a8306144926641e4ba7f39aef508cf3a1fbac13accac3319e29272ea42105e7a5020bba5721a0c26e8ebc0aeacec26047458e6fe3d6729525a')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # install systemd file
  install -Dm 644 "${srcdir}"/*.service -t "${pkgdir}"/usr/lib/systemd/system

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

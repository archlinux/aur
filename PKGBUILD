# Maintainer: bitcoinlizard <bitcoinlizard@fastmail.com>

pkgname=python-hwilib
pkgver=2.0.1
pkgrel=1
pkgdesc="The Bitcoin Hardware Wallet Interface is a Python library and command line tool for interacting with hardware wallets."
arch=('any')
url="https://github.com/bitcoin-core/HWI"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'libusb' 'systemd-libs' 'python-libusb1' 'python-base58' 'python-bitbox02' 'python-hidapi' 'python-cryptography' 'python-mnemonic')

source=("https://github.com/bitcoin-core/HWI/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e758f4b83928a4d71b7541958ac6c130cc137e14161942fdec8c812afb2130db')

prepare() {
  cd "HWI-${pkgver}"
}

build() {
  cd "HWI-${pkgver}"

  python setup.py build
}

package() {
  cd "HWI-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/HWI-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

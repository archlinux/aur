# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-bitbox02
_pkgname=bitbox02-firmware-firmware-btc-only
pkgver=9.2.1
pkgrel=1
pkgdesc="Python code to communicate with BitBox02 cryptocurrency wallet"
arch=('any')
depends=('python' 'bitbox-udev' 'python-tzlocal' 'python-pyserial' 'python-requests' 'python-base58' 'python-semver' 'python-noiseprotocol-git')
makedepends=()
url="https://github.com/digitalbitbox/bitbox02-firmware"
license=('Apache')
options=('!emptydirs')
source=($_pkgname-v$pkgver::https://github.com/digitalbitbox/bitbox02-firmware/archive/firmware-btc-only/v$pkgver.tar.gz)
sha256sums=('0036a13b114760adc1fdb719cc97033a9dabe44f1a713e120ded4a917d905a2a')

build() {
  cd "$srcdir/$_pkgname-v$pkgver/py/bitbox02"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver/py/bitbox02"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

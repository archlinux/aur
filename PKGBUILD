# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>
pkgname=python38-cryptography
pkgver=38.0.3
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography"
depends=('python38-cffi')
makedepends=('python38-setuptools-rust')
checkdepends=('python38-pytest-runner' 'python38-pytest-subtests' "python38-cryptography-vectors=$pkgver"
              'python38-iso8601' 'python38-pretend' 'python38-hypothesis' 'python38-pytz'
              'python38-pytest-benchmark')
source=("https://pypi.io/packages/source/c/cryptography/cryptography-$pkgver.tar.gz")
sha512sums=('f133d83266f386cb0169a3cf2226d258b7d599e7aaad9913f8a4b01ee0841670586a21cee93fb4d4d9f61b0da53109c5dbcf7d91d470cfbb166aa04f4a1d7634')

build() {
  cd cryptography-$pkgver
  python3.8 setup.py build
}

check() {
  cd cryptography-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd cryptography-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
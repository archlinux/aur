# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_pkgname=pydantic
pkgname="python-${_pkgname}-latest"
pkgver=1.9.1
pkgrel=1
pkgdesc='Data parsing and validation using Python type hints (up to date version)'
arch=('any')
url='https://github.com/samuelcolvin/pydantic'
license=('MIT')
depends=('python' 'python-typing-extensions')
optdepends=('python-email-validator: email')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4eddd11262bc0d708ba0ffb88565cc624f34e43b2388cfa61c5d1a0ed154628c')
provides=("python-${_pkgname}=${pkgver}")
conflicts=("python-${_pkgname}")

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver

  python setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

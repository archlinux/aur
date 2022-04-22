# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_pkgname=pydantic
pkgname="python-${_pkgname}-latest"
pkgver=1.9.0
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
sha256sums=('8a02ed110f264f57788e4761f6a772cdcf02dad65b73be280265e7bb4fc66793')
provides=("python-${_pkgname}")
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

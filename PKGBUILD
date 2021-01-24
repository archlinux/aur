# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litepcie
pkgname=python-$_pkgname
pkgver=2020.12
pkgrel=1
pkgdesc='Small footprint and configurable PCIe core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2daa037d116becb3e150c318a89375863b08aae3b9d2119122f369072f8000999ac67031fa0b687cc58cd38bce62e0ef3b96dd7def7f89229f4102d5d0295143')

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

# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litepcie
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=3
pkgdesc='Small footprint and configurable PCIe core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-litex-boards')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dbfecb9a3c47cb0ad3711bb7881557b8b1d598bfff87835ca6d7fda15b2a991797a675690da11b1fe46f3cf2a98ca3f2be35193e63b9e596bb1d697dde70a941')

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

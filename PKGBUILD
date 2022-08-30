# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litepcie
pkgname=python-$_pkgname
pkgver=2021.04
pkgrel=1
pkgdesc='Small footprint and configurable PCIe core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-litex-boards')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f7186b426023305ea4a40dfa93608474c737554098a4c60cd80050b72dd4a255bd621b53f04d7f88983a1e125e4f41ab541344ce625ce867b82bd0fc5add0f96')

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

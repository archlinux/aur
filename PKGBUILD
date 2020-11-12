# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litejesd204b
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=3
pkgdesc='Small footprint and configurable JESD204B core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4958100b70e688c915ff4d0c60f067df6b512feaa47c4f384dcb91f3643c6ce36bd51cf041cc5fbba392aa8a353e46c37ba79ad560bf0e10ee48896b15e2b9b6')

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

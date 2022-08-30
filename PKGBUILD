# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litejesd204b
pkgname=python-$_pkgname
pkgver=2021.04
pkgrel=1
pkgdesc='Small footprint and configurable JESD204B core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c3c7ae42d17633da9433836ac4f1e3203265eda3a53a3449ecfaa927b6d18fd0e1acd24b8eb3d6991cd56691c20ef38be9454f230e90a0cd27484f4939309126')

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

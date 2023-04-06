# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=okonomiyaki
pkgname=python-$_pkgname
pkgver=1.3.2
pkgrel=2
pkgdesc='Experimental library aimed at consolidating a lot of our low-level code used for Enthought eggs'
arch=('any')
url='https://github.com/enthought/okonomiyaki'
license=('MIT')
depends=('python' 'python-attrs' 'python-jsonschema' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('89877ecca20370bcfd3f74429913e708a1e10f841fac012e154c4b43862dc9f1644d1b70638811cae71e5651565514db002ca777466b5e848009d7699b5735ed')

build() {
  cd $_pkgname-$pkgver

  find -type f -name '*.py' -exec sed -i 's|zipfile2|zipfile|' '{}' +
  sed -i /zipfile2/d setup.py
}

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

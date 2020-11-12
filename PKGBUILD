# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=okonomiyaki
pkgname=python-$_pkgname
pkgver=1.2.0
pkgrel=4
pkgdesc='Experimental library aimed at consolidating a lot of our low-level code used for Enthought eggs'
arch=('any')
url='https://github.com/enthought/okonomiyaki'
license=('MIT')
depends=('python' 'python-attrs' 'python-jsonschema' 'python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b84e3c188037cf5e5e5e70db27dafe331b0a9db861d93e399b2c123c602c991147a7d99ff94fdcd1d8ba0d7eceab2111dbf0ff7af8b71afb5ee8342f204cc55c')

build() {
  find $_pkgname-$pkgver -type f -name '*.py' -exec sed -i 's|zipfile2|zipfile|' '{}' +
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  sed -i /zipfile2/d "$pkgdir"/usr/lib/python*/site-packages/okonomiyaki-*.egg-info/requires.txt
}

# vim:set ts=2 sw=2 et:

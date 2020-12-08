# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=edalize
pkgname=python-$_pkgname
pkgver=0.2.3
pkgrel=1
pkgdesc='An abstraction library for interfacing EDA tools'
arch=('any')
url='https://github.com/olofk/edalize'
license=('BSD')
depends=('python' 'python-jinja')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1c07b8edba66d174eb49f6098e4f1811ffcaeda7b46a9773e31103649f6e5aa2dc31df3a7ea0f128fdd35aa2e42e547ecbdd057cde6c7e7653b6d94357d61ce9')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd $_pkgname-$pkgver

  rm tests/test_spyglass.py

  sed -i '/pytest/d' setup.py
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=. pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

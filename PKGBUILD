# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=edalize
pkgname=python-$_pkgname
pkgver=0.5.0
pkgrel=2
pkgdesc='An abstraction library for interfacing EDA tools'
arch=('any')
url='https://github.com/olofk/edalize'
license=('BSD')
depends=('python' 'python-jinja' 'python-pyparsing')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-pandas' 'iverilog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c0e4b21eb8ae43e2d1a54096ae4a82b36cdfd7ee66126978a2d0e148693b659309fca607098f37fd1425317f6161a09cc1eea1de99e0727bc8942fd5d6f76e7c')

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

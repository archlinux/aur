# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=edalize
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc='An abstraction library for interfacing EDA tools'
arch=('any')
url='https://github.com/olofk/edalize'
license=('BSD')
depends=('python' 'python-jinja')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-pandas' 'iverilog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('242ec052faef6882d3451183e8749fd1161839ce6858a006164aec313544628c50e4a47778ca33de9c7324cd20c7c047db4d454c66c4d9cfdd6402d6efe291a7')

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

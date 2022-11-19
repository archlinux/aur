# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-theme-builder
pkgname=python38-$_pkgname
pkgver=0.2.0b1
pkgrel=1
pkgdesc='Python build backend for Sphinx themes'
arch=('any')
url='https://github.com/pradyunsg/sphinx-theme-builder'
license=('BSD')
depends=('python38' 'python38-packaging' 'python38-rich' 'python38-tomli' 'python38-nodeenv' 'python38-setuptools' 'python38-pep621' 'python38-pyproject-metadata')
optdepends=('python38-build: CLI'
            'python38-click: CLI'
            'python38-sphinx-autobuild: CLI')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core')
checkdepends=('python38-pytest' 'python38-click' 'python38-sphinx-autobuild')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dd7a5ff4f0765abc0ed92d6588e9d46e40c521787340578016a2dc9acc6f0da1eb40ad7eb08ca76901ce724db47a126132d6d6a96041b36f9000d5299d36e246')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=src pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

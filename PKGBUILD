# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=edalize
pkgname=python-$_pkgname
pkgver=0.6.1
pkgrel=1
pkgdesc='An abstraction library for interfacing EDA tools'
arch=('any')
url='https://github.com/olofk/edalize'
license=('BSD-2-Clause')
depends=('python' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pyparsing' 'python-pandas' 'iverilog')
optdepends=(
  'python-pandas: enable reporting features'
  'python-pyparsing: enable reporting features'
  'python-vunit: VUnit backend support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('32f101b189b1eab6ae481847d427cef33b707627477a533e4f2af3744b298d9f8b0524e82b00d3fe57114237d955d4eea9a4878ad6e96f128ee7e3389e0d7495')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=. pytest
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

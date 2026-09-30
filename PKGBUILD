# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=edalize
pkgname=python-$_pkgname
pkgver=0.6.8
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
sha512sums=('2c1c54ee157ebc17f512d9f7d72fd3c73a2f9d9b8406187223db95b9ab80f0baa357a4c60169e29419459b8b0acb83d3166cc6cb4b9754d32b159de1202c59c2')

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

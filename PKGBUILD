#!/bin/bash
# Maintainer: Dringsim <dringsim@qq.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>

_name=mapclassify
pkgname=python-mapclassify
pkgver=2.8.1
pkgrel=1
pkgdesc='Classification schemes for choropleth mapping.'
url='https://github.com/pysal/mapclassify'
arch=('any')
license=('BSD')
depends=(
  'python-scipy'
  'python-numpy'
  'python-scikit-learn'
  'python-pandas'
  'python-networkx'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('306f4cb99ad1ea166b3efd7180c0a199d240bd801de7937327973d829673bc82')

build() {
  cd "$_name-$pkgver" || exit
  python -m build --wheel --no-isolation
  # export PYTHONHASHSEED=0
  # python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

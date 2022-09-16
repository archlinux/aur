# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-blackdoc
_pypi=blackdoc
pkgdesc='Run Black on documentation code snippets'
pkgver=0.3.7
pkgrel=1
url='https://github.com/keewis/blackdoc'
license=('MIT')
arch=('any')
depends=('python-black' 'python-more-itertools')
optdepends=(
  'ipython: for working with .ipynb files'
  'python-tokenize-rt: for working with .ipynb files'
)
makedepends=(
  'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
  'python-wheel'
)
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '0b2e3f2f5611112532c85647a39cdc6e7ced660530e942331aa971c49c71deae'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  PYTHONPATH=$PWD/build/lib pytest -v
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

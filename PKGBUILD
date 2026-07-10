# Maintainer: Behnam Lal <dev at behnamlal dot xyz>
# Contributor: Patrick Mischke

pkgname='python-pygad'
_name='pygad'
pkgver=3.7.0
pkgrel=1
pkgdesc="A Python 3 Library for Building the Genetic Algorithm and Training Machine Learning Algorithms"
url="https://github.com/ahmedfgad/GeneticAlgorithmPython"
depends=(
  'python-numpy'
  'python-matplotlib'
  'python-cloudpickle'
)
makedepends=(
  'python-build'
  'python-setuptools'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9858226f1b1482ab845b3129152fe9ca4457a7bcae5804717647beacd00b734c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vv
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

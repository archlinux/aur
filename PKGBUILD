# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-imagededup
_pkg="${pkgname#python-}"
pkgver=0.2.4
pkgrel=2
pkgdesc='Finding duplicate images made easy'
arch=('x86_64')
url='https://github.com/idealo/imagededup'
license=('Apache')
depends=(
  'python-matplotlib'
  'python-numpy'
  'python-pillow'
  'python-pywavelets'
  'python-scikit-learn'
  'python-scipy'
  'python-tensorflow'
  'python-tqdm')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ec8b4d5bd23b50fdf12e3dea5eb680b6852cea13fea3a3ec506098ea91b54c24')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  local _py="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" pytest -x --disable-warnings
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:

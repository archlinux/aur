# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-rst.linker
_name=${pkgname#python-}
pkgver=2.5.0
pkgrel=1
pkgdesc="Can add links and perform other custom replacements to rst"
arch=('any')
url="https://github.com/jaraco/rst.linker"
license=('MIT')
depends=(
  'python-dateutil'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
# for building docs
#makedepends+=(
#  'python-domdf-python-tools'
#  'python-jaraco.packaging'
#  'python-sphinx'
#  'python-sphinx-furo'
#)
#checkdepends=(
#  'python-path'
#  'python-pytest-black'
##  'python-pytest-checkdocs' ## TODO
#  'python-pytest-cov'
#  'python-pytest-enabler'
#  'python-pytest-flake8'
#  'python-pytest-mypy'
#  'python-types-python-dateutil'
#)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6b019a00dc184ae81ff5c38ec292bd1c55b1ea25cf8ab1a88dc6d0e8249cb0f')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  # generate html docs
#  PYTHONPATH=./ sphinx-build docs html

  # remove the sphinx-build leftovers
#  rm -rf html/.{doctrees,buildinfo}
}

#check() {

#FAILED docs/conf.py::BLACK
#FAILED rst/linker.py::BLACK
#FAILED test_all.py::BLACK

#  cd "$_name-$pkgver"
#  python -m venv --clear --without-pip --system-site-packages .testenv
#  .testenv/bin/python -m installer dist/*.whl
#  .testenv/bin/python -m pytest || :
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

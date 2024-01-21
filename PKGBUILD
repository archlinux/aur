# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-rst.linker
_name=${pkgname#python-}
pkgver=2.4.0
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b41018765f1f65e3e6dfae6ea23cd699e0a26d8ce34cd3bcfd6f779af2944f01')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation

  # generate html docs
  # this package requires itself to build docs :/
#  PYTHONPATH=./ sphinx-build docs html

  # remove the sphinx-build leftovers
#  rm -rf html/.{doctrees,buildinfo}
}

# flake-8::FLAKE8 - AttributeError: 'Application' object has no attribute 'parse_preliminary_options'

#check() {
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

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-jaraco.packaging
_name=${pkgname#python-}
pkgver=9.1.2
pkgrel=1
pkgdesc="Tools to supplement packaging Python releases"
arch=('any')
url="https://github.com/jaraco/jaraco.packaging"
license=('MIT')
depends=('python' 'python-build')
makedepends=('python-installer' 'python-setuptools-scm' 'python-wheel')
#makedepends+=('python-pip' 'python-rst.linker' 'python-sphinx-furo' 'python-sphinx-lint') # for building docs
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0aab5c32ce8c495dcc253028b46196d7e198f127b200a488d32b65cba8eee337')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation

  # generate html docs
  # this package requires itself to build docs :/
#  PYTHONPATH=./ sphinx-build docs html

  # remove the sphinx-build leftovers
#  rm -rf html/.{doctrees,buildinfo}
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

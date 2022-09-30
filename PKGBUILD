# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-jaraco.packaging
_name=${pkgname#python-}
pkgver=9.1.1
pkgrel=1
pkgdesc="Tools to supplement packaging Python releases"
arch=('any')
url="https://github.com/jaraco/jaraco.packaging"
license=('MIT')
depends=('python' 'python-build')
makedepends=('python-installer' 'python-setuptools-scm' 'python-wheel')
#makedepends+=('python-pip' 'python-rst.linker' 'python-sphinx') # for building docs
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('70aa6e1834d6698d57f9a490e453fcadf7b804a131caf88321d590bf0b49cd6e')

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

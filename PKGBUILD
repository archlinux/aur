# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-atheris
pkgver=2.0.12
pkgrel=1
pkgdesc='A coverage-guided fuzzer for Python and Python extensions'
arch=('x86_64')
url='https://github.com/google/atheris/'
license=('Apache')
depends=('python')
makedepends=(
  'git'
  'clang'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'pybind11'
)
_commit='cbd372db6a61577566b967587b12fd934b937f2d'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # https://github.com/google/atheris/issues/45
  git describe --tags | sed 's/^v//'

  #grep ATHERIS_VERSION setup.py | sed -e 's/.*ATHERIS_VERSION", "\(.*\)")/\1/'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

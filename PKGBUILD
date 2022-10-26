# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-atheris
pkgver=2.1.1
pkgrel=1
pkgdesc='A coverage-guided fuzzer for Python and Python extensions'
arch=('x86_64')
url='https://github.com/google/atheris'
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
_commit='6068f9e520ba4f7218075f1a6bf3426b288d17f8'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

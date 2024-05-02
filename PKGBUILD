# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-domdf-python-tools
pkgver=3.8.0
pkgrel=3
pkgdesc='Helpful functions for Python'
arch=('any')
url='https://domdf-python-tools.readthedocs.io'
license=('MIT')
depends=(
  'python'
  'python-natsort'
  'python-typing_extensions'
  'python-pandas'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
_commit='3e189a571f33367df2bfa45973079d8907e13bf1'
source=("$pkgname::git+https://github.com/domdfcoding/domdf_python_tools#commit=$_commit")
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

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-domdf-python-tools
pkgver=3.6.1
pkgrel=1
pkgdesc='Helpful functions for Python'
arch=('any')
url='https://domdf-python-tools.readthedocs.io'
license=('MIT')
# double check if the importlib packages are actually required
depends=(
  'python'
  'python-natsort'
  'python-typing_extensions'
  'python-pandas'
  'python-importlib-metadata'
  'python-importlib_resources'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
_commit='d01397ae9995b0b72d5ca9f722bca36cda55b4ef'
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

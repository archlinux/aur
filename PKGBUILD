# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-deprecation-alias
pkgver=0.3.1
pkgrel=1
pkgdesc='A wrapper around deprecation providing support for deprecated aliases'
arch=('any')
url='https://github.com/domdfcoding/deprecation-alias'
license=('Apache')
depends=('python' 'python-deprecation' 'python-packaging')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
_commit='d0e0e11ae8276a3b383db3fa01a9ee0ba10d8695'
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

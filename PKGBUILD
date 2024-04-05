# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-deprecation-alias
pkgver=0.3.2
pkgrel=2
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
_commit='f5c99188130565e810943755bf8568b840ec830a'
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

# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-handy-archives
pkgver=0.2.0
pkgrel=2
pkgdesc='Handy archive helpers for Python'
arch=('any')
url='https://handy-archives.readthedocs.io/'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
#checkdepends=('') pytest+coincidence
#optdepends=('')
_commit='fadd8999b7bdb0f5220683ee55bf107de819fa16'
source=("$pkgname::git+https://github.com/domdfcoding/handy-archives#commit=$_commit")
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

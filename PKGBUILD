# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-handy-archives
pkgver=0.1.4
pkgrel=1
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
_commit='2727131dde46ecf1aa9cc39362e8a8255a9ccaf5'
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

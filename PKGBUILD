# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-apeye-core
pkgver=1.1.4
pkgrel=1
pkgdesc='Core (offline) functionality for the apeye library'
arch=('any')
url='https://github.com/domdfcoding/apeye-core'
license=('MIT')
depends=(
  'python'
  'python-domdf-python-tools'
  'python-idna'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatch-requirements-txt'
)
#checkdepends=('')
#optdepends=('')
_commit='5f4dd62c7a3926c4615bbcccf2273bcafcc5487c'
source=("$pkgname::git+https://github.com/domdfcoding/apeye-core#commit=$_commit")
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

# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-consolekit
pkgver=1.4.1
pkgrel=1
pkgdesc='Additional utilities for click'
arch=('any')
url='https://consolekit.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-colorama'
  'python-deprecation-alias'
  'python-domdf-python-tools'
  'python-mistletoe'
  'python-typing-extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
optdepends=(
  'python-psutil: better terminal support'
)
_commit='c39a554528649cec11bac083ad44f14b865307a7'
source=("$pkgname::git+https://github.com/domdfcoding/consolekit#commit=$_commit")
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

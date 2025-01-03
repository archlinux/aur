# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
pkgver=1.0.3
pkgrel=1
pkgdesc='Use Poetry inside Nox sessions'
arch=('any')
url='https://github.com/cjolowicz/nox-poetry'
license=('MIT')
depends=(
  'python'
  'python-nox'
  'python-tomlkit'
  'python-packaging'
  'python-poetry'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)

source=("$pkgname::git+$url#tag=v$pkgver")
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

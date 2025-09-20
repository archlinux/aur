# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
pkgver=1.2.0
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
b2sums=('b99152d95a8a17434d9fd0b2e846c3fa5acc7fa77fc685b73622c6af71919fb2b8287bcd0f0cb4975fcff9d38e2f1648c2d3ccf913eec4b4b999a2228088b349')

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

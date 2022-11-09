# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
pkgver=1.0.2
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
#checkdepends=('python-pytest' 'python-pytest-datadir' 'python-pygments' 'python-typing_extensions')
_commit='5772b66ebff8d5a3351a08ed402d3d31e48be5f8'
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

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

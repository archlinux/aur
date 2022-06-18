# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
_pkgname="${pkgname#python-}"
pkgver=1.0.0
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
_commit='b1076ef88f66ad5ec97b65dff4762e0dc4c4af0a'
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

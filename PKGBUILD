# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-pytest-style
pkgver=1.7.2
pkgrel=1
pkgdesc='A flake8 extension that checks issues with pytest tests'
arch=('any')
url='https://github.com/m-burst/flake8-pytest-style'
license=('MIT')
depends=('python' 'flake8' 'python-flake8-plugin-utils')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
#checkdepends=('python-pytest-deadfixtures')
_commit='01a4c8eaf64292363bcbae4c93bfdd6722a494ff'
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

#check() {
#  cd "$pkgname"
#
#  pytest -v
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pypyr
pkgver=5.7.1
pkgrel=1
pkgdesc='Task runner for automation pipelines'
arch=('any')
url='https://pypyr.io'
license=('Apache')
depends=(
  'python'
  'python-dateutil'
  'python-ruamel-yaml'
  'python-tomli'
  'python-tomli-w'
)
makedepends=(
  'git'
  'python-flit-core'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pyfakefs')
_commit='dc3ccc42000f24bd937d5932f7ba65bdade0ac91'
source=("$pkgname::git+https://github.com/pypyr/pypyr.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

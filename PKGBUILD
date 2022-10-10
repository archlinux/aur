# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pydel
pkgver=0.5.3
pkgrel=1
pkgdesc='Python module for parsing Synthstrom Audible Deluge song files'
arch=('any')
url='https://github.com/dcower/pydel'
license=('MIT')
depends=('python' 'python-attrs')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
_commit='c3d61a92ed3d4da1bd401872fab506f96f2989d3'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # no tagged releases
  grep version setup.py | sed -e "s/^.*='//" -e "s/',//"
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

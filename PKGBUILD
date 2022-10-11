# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-del2rpp
pkgver=0.1.0
pkgrel=1
pkgdesc='Tool for converting Synthstrom Audible Deluge songs to REAPER projects'
arch=('any')
url='https://github.com/dcower/del2rpp'
license=('MIT')
depends=(
  'python'
  'python-pydel'
  'python-rpp'
  'python-attrs'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
_commit='d0afa4ec39c2060b44e772f87a6700807d8d8155'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # no tagged releases
  grep '^    version' setup.py | sed -e "s/^.*='//" -e "s/',//"
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

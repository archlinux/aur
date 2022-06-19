# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pglast
_pkgname="${pkgname#python-}"
pkgver=3.12
pkgrel=1
pkgdesc='PostgreSQL language AST and statement prettifier'
arch=('x86_64')
url='https://github.com/lelit/pglast'
license=('GPL3')
depends=('python')
makedepends=('git' 'cython' 'python-setuptools' 'protobuf-c')
#checkdepends=('python-pytest' 'python-pytest-cov')
_commit='422fde18650602e6a6d33fe34ab185b2470ef8e2'
source=("git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init
}

build() {
  cd "$_pkgname"
  python setup.py build
}

# TODO fix this later
#check() {
#  cd "$_pkgname"
#  PYTHONPATH="build/lib.linux-x86_64-3.9:$PYTHONPATH" pytest
#}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

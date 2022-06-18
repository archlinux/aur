# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pglast
_pkgname="${pkgname#python-}"
pkgver=3.11
pkgrel=1
pkgdesc='PostgreSQL language AST and statement prettifier'
arch=('x86_64')
url='https://github.com/lelit/pglast'
license=('GPL3')
depends=('python')
makedepends=('git' 'cython' 'python-setuptools' 'protobuf-c')
#checkdepends=('python-pytest' 'python-pytest-cov')
_commit='f351e0f3d3b9b92422b012d49e486f8c286662e5'
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

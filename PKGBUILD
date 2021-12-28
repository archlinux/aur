# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pglast
_pkgname="${pkgname#python-}"
pkgver=3.8
pkgrel=1
pkgdesc="PostgreSQL Languages AST and statements prettifier"
arch=('x86_64')
url="https://github.com/lelit/pglast"
license=('GPL3')
depends=('python')
makedepends=('cython' 'python-setuptools' 'git')
#checkdepends=('python-pytest' 'python-pytest-cov')
_commit='b2f17dcd85d00818a767b8dced19247e68aa0909'
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

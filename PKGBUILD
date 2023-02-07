# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Mark Merritt <mark@marktmerritt.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-importlab
pkgver=0.8
pkgrel=1
pkgdesc='A library to calculate Python dependency graphs'
arch=('any')
url='https://github.com/google/importlab'
license=('Apache')
depends=(
  'python'
  'python-networkx'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=('')
#optdepends=('')
_commit='13737c19e056f1095486c522adafa0f4b71f31a8'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # get from setup.py since there are no tagged releases
  grep '^VERSION' setup.py | sed -e "s/VERSION = '\(.*\)'/\1/"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname"
#
#  # TODO
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

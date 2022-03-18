# Maintainer: a821
# Contributor: Felix Yan
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=python-pycparser-git
pkgver=2.21.r2.g6a7edee
pkgrel=1
epoch=1
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
makedepends=('git' 'python-setuptools')
depends=('python-ply')
conflicts=('python-pycparser')
arch=('any')
license=('BSD')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd pycparser
  git describe --long --tags | sed -e 's/.*_v//;s/-/.r/;s/-/./'
}

build() {
  cd pycparser
  python setup.py build
  cd pycparser
  python _build_tables.py
}

check() {
  cd pycparser
  python -m unittest discover
}

package() {
  cd pycparser
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

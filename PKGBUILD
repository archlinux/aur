# Maintainer: a821
# Contributor: Felix Yan
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=python-pycparser-git
pkgver=2.22.r9.g9cecc09
pkgrel=1
epoch=1
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-ply')
provides=('python-pycparser')
conflicts=('python-pycparser')
arch=('any')
license=('BSD-3-Clause')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd pycparser
  git describe --long --tags | sed -e 's/.*_v//;s/-/.r/;s/-/./'
}

build() {
  cd pycparser
  python -m build --wheel --no-isolation
}

check() {
  cd pycparser
  python -m unittest discover
}

package() {
  cd pycparser
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

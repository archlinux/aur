# Maintainer: Oskar Roesler <oskar at oskar-roesler dot de>

pkgname=python2-pycparser
pkgver=2.21
pkgrel=1
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
depends=('python2-ply')
makedepends=('python2-setuptools')
arch=('any')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eliben/pycparser/archive/release_v$pkgver.tar.gz")
sha512sums=('b141e14040774ddaae6cd1726b0b2a61bfa76e8bcb5dc25dd99a303c48c7257dd7214cc7704234b0045ccc6a47354f6a7639647d875e1266846659217cc6ea78')

build() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python2 setup.py build
  cd pycparser
  python2 _build_tables.py
}

check() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python2 -m unittest discover
}

package() {
  cd pycparser-release_v$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

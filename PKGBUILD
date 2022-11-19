# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python38-more-itertools
pkgver=9.0.0
pkgrel=1
pkgdesc='More routines for operating on iterables, beyond itertools'
arch=('any')
url='https://github.com/more-itertools/more-itertools'
license=('MIT')
depends=('python38')
makedepends=(
  'git'
  'python38-build'
  'python38-installer'
  'python38-wheel'
  'python38-flit-core'
)
_commit='ffcfe0b4e63c75fe1470b8b25a29b0e698a9a587'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python3.8 -m unittest
}

package() {
  cd "$pkgname"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
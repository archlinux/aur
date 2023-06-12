# Maintainer:
# Contributor: Platon Pronko <platon7pronko@gmail.com>

_gitname="kdtree"
_pkgname="python-$_gitname"
pkgname="$_pkgname"
pkgver="0.16"
pkgrel=3
pkgdesc='Construct, modify and search k-d trees'
arch=('any')
url='https://github.com/stefankoegl/kdtree'
license=('ISC')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  "$_gitname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz"
)
sha256sums=(
  '1a51501998f29d04aa6851572c7b59a3923af72b6b72a59c64c8ec6536c04b85'
)

build() {
  cd "$srcdir/$_gitname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_gitname-$pkgver"
  python -m unittest
}

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

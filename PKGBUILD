# Maintainer:
# Contributor: Platon Pronko <platon7pronko@gmail.com>

_gitname="kdtree"
_pkgname="python-$_gitname"
pkgname="$_pkgname"
pkgver="0.16"
pkgrel=4
pkgdesc='Construct, modify and search k-d trees'
url='https://github.com/stefankoegl/kdtree'
license=('ISC')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_gitname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext"
)
sha256sums=(
  '1a51501998f29d04aa6851572c7b59a3923af72b6b72a59c64c8ec6536c04b85'
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgsrc"
  python -m unittest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

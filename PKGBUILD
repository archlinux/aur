# Maintainer: aur.chaotic.cx
# Contributor: Platon Pronko <platon7pronko@gmail.com>

_gitname="kdtree"
_pkgname="python-$_gitname"
pkgname="$_pkgname"
pkgver=0.17
pkgrel=1
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
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('4a4c2ceda47f082cce52e05fea2692a7abfe3a91416cf24c548398fe7b4eed95')

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

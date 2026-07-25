# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-fortune-python
_name=${pkgname#python-}
pkgver=1.1.2
pkgrel=2
pkgdesc="A simple self-contained clone of fortune."
arch=('any')
url="https://codeberg.org/jamesansley/fortune"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$_name-$pkgver.tar.gz")
sha256sums=('d582fc7a36c8c146e7f0622be277cb2ea35bffc5524a91c3c1ba920399c71e9d')

prepare() {
  mkdir -p "$_name-$pkgver"
  bsdtar xf "$_name-$pkgver.tar.gz" --strip-components 1 -C "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

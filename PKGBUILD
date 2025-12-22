# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-fortune-python
_name=${pkgname#python-}
pkgver=1.1.2
pkgrel=1
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
sha256sums=('27fc82411a4e941e55373361c2095215fb825a626a345563d9381f78ad918375')

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

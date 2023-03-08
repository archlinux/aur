# Contributor: Filip Graliński <filipg@amu.edu.pl>

_pkgname=python-tokenizers
pkgname="$_pkgname"
pkgver=0.13.2
pkgrel=3
pkgdesc='Fast State-of-the-Art Tokenizers optimized for Research and Production'
arch=('i686' 'x86_64')
url="https://github.com/huggingface/tokenizers"
license=('Apache')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-rust'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_pkgname"::"git+$url#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "$srcdir/$_pkgname/bindings/python"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgname/bindings/python"
  python -m installer \
    --compile-bytecode 1 \
    --destdir "$pkgdir" \
    dist/*.whl
}

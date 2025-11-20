# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-spandrel-extra-arches
_pkgname=spandrel
_spandrel_ver=0.4.1
pkgver=0.2.0
pkgrel=1
pkgdesc="Additional architecture implementations for Spandrel (PyTorch model loader)"
arch=('any')
url='https://github.com/chaiNNer-org/spandrel'
license=('MIT')
depends=(
  'python'
  'python-spandrel'
  'python-pytorch'
  'python-torchvision'
  'python-safetensors'
  'python-numpy'
  'python-einops'
  'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=(
  "$_pkgname-$_spandrel_ver.tar.gz"::"https://github.com/chaiNNer-org/spandrel/archive/refs/tags/v$_spandrel_ver.tar.gz"
)
sha256sums=('12063b78bb3a1979617e697a66994be9e651117425e19f7004af2a3e34ad2b97')

build() {
  cd "$_pkgname-$_spandrel_ver/libs/spandrel_extra_arches"
  python -m build -nw
}

check() {
  cd "$_pkgname-$_spandrel_ver"
  PYTHONPATH="$PWD/libs/spandrel_extra_arches/build/lib" \
    python -c 'import spandrel_extra_arches'
}

package() {
  cd "$_pkgname-$_spandrel_ver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  python -m installer --compile-bytecode=1 --destdir="$pkgdir" \
    "$srcdir/$_pkgname-$_spandrel_ver"/libs/spandrel_extra_arches/dist/spandrel_extra_arches-"$pkgver"-py3-*-*.whl
}

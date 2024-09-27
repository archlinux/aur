# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Maintainer: @xiota
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.30.2
pkgrel=1
pkgdesc='Pretrained diffusion models for image and audio generation in PyTorch'
url='https://github.com/huggingface/diffusers'
license=('Apache-2.0')
arch=('any')
groups=('huggingface')
depends=(
  'python-filelock'
  'python-huggingface-hub'
  'python-numpy'
  'python-pillow'
  'python-regex'
  'python-requests'
  'python-safetensors'
)
optdepends=(
  'python-tensorflow: TensorFlow support'
  'python-pytorch: PyTorch support'
  'python-flax: JAX/FLAX support'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('208a63d243ecdf0aed6e03ffc5b3fc783f94dca058e269e2bf6f2a950d3cea52')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

check() {
  PYHONPATH=$srcdir/$_pkgsrc/src python -c 'import diffusers'
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

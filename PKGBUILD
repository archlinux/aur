# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Maintainer: @xiota
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.28.2
pkgrel=1
pkgdesc='Pretrained diffusion models for image and audio generation in PyTorch'
url='https://github.com/huggingface/diffusers'
license=('Apache-2.0')
arch=('any')

depends=(
  'python-filelock'
  'python-huggingface-hub'
  'python-numpy'
  'python-pillow'
  'python-pytorch'
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
sha256sums=('88ac76f5e3be2dbd5c179d17b80625102f325685c750cbf48f9991dc10d9e088')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

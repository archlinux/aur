# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Maintainer: @xiota
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.32.2
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
  'python-accelerate: multi-GPU and TPU training support'
  'python-datasets: datasets and data loading'
  'python-flax: JAX/FLAX support'
  'python-peft: parameter efficient fine-tunning'
  'python-pytorch: PyTorch support'
  'python-tensorflow: TensorFlow support'
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
sha256sums=('c20d21991a3a26d09d05e646b4b4cf5675329b7919a706d5f222ce4a9d6d2e18')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

check() {
  PYTHONPATH=$srcdir/$_pkgsrc/src python -c 'import diffusers'
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Maintainer: @xiota
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.30.1
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
sha256sums=('868b7ad4ff27b38b5a9cda0b639b16599791e7b70e39320e31720abc7e8e8924')

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

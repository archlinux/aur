# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-trl
_pkgname=${pkgname#python-}
pkgver=0.7.2
pkgrel=1
pkgdesc='Train transformer language models with reinforcement learning'
arch=('any')
url='https://github.com/huggingface/trl'
license=('Apache')
depends=(
  'python-accelerate'
  'python-datasets'
  'python-peft'
  'python-pytorch'
  'python-tqdm'
  'python-transformers'
  'python-tyro'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-diffusers: Diffusion models'
  'python-peft: Parameter efficient fine-tuning'
  'python-deepspeed: Low-level routines for distributed training'
  'bitsandbytes: Quantization support'
)
source=(
  "python-trl-$pkgver.tar.gz"::"https://github.com/lvwerra/trl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('873789ec1eb59ed3adebab7fd7814d001813a4662f6ed814f906d2453fbb0e43')

build() {
  python -m build -nw $_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

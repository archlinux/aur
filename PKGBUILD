# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-trl
_pkgname=${pkgname#python-}
pkgver=0.6.0
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
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=(
  "python-trl-$pkgver.tar.gz"::"https://github.com/lvwerra/trl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('e58d4935d53c3e830e99d8bbb307a7fa0415336be441d3b31163fdc54922f2aa')

build() {
  python -m build -nw $_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

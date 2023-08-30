# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-trl
_pkgname=${pkgname#python-}
pkgver=0.7.0
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
sha256sums=('f8492836a87e3dcbdc6409f8a5f3faa141870718b8444d08c1c16304ae3eeb18')

build() {
  python -m build -nw $_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

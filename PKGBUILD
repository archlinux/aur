# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Contributor: jzbor <zborof at posteo dot de>

pkgname=python-accelerate
_pkgname=${pkgname#python-}
pkgver=0.27.1
pkgrel=1
pkgdesc='A simple way to train and use PyTorch models with multi-GPU, TPU, mixed-precision'
arch=('any')
url='https://github.com/huggingface/accelerate'
license=('Apache')
groups=('hugginface')
depends=(
    'python-huggingface-hub'
    'python-numpy'
    'python-packaging'
    'python-psutil'
    'python-pytorch'
    'python-safetensors'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/huggingface/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a620b67efcdb73ac60dc0da0ee8439902a1f0ecb3da8587392964f25c25fd2b')

build() {
    cd $_pkgname-$pkgver
    python -m build -n -w
}

check() {
    cd $_pkgname-$pkgver/src
    python -c 'import accelerate'
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-py3-*-*.whl
}

# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-peft
_pkgname=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc='State-of-the-art Parameter-Efficient Fine-Tuning.'
arch=('any')
url='https://github.com/huggingface/peft'
license=('Apache')
groups=('hugginface')
depends=(
    'python-accelerate'
    'python-huggingface-hub'
    'python-numpy'
    'python-packaging'
    'python-psutil'
    'python-pytorch'
    'python-safetensors'
    'python-tqdm'
    'python-transformers'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/huggingface/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5ba1c10c8b15a4789bffca0b9b9911710a0575786b8254349ce1868e4e13cd3')

build() {
    python -m build -nw $_pkgname-$pkgver
}

check() {
    export PYTHONPATH=$srcdir/$_pkgname-$pkgver/src
    python -c 'import peft'
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-py3-*-*.whl
}

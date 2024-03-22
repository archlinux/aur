# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-peft
_pkgname=${pkgname#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc='State-of-the-art Parameter-Efficient Fine-Tuning.'
arch=('any')
url='https://github.com/huggingface/peft'
license=('Apache')
groups=('hugginface')
depends=(
    'python-accelerate'
    'python-bitsandbytes'
    'python-datasets'
    'python-numpy'
    'python-packaging'
    'python-psutil'
    'python-pytorch'
    'python-safetensors'
    'python-scipy'
    'python-tqdm'
    'python-transformers'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/huggingface/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56037ec9364ab60ffbec9d4e69c5337bd76fc0e1772977d786fc449f852ed30a')

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

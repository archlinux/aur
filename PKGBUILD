# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-peft
_pkgname=${pkgname#python-}
pkgver=0.17.1
pkgrel=1
pkgdesc='State-of-the-art Parameter-Efficient Fine-Tuning.'
arch=('any')
url='https://github.com/huggingface/peft'
license=('Apache-2.0')
groups=('huggingface')
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
sha256sums=('d9d8a31f757a777ab19839a33551389daa8e23c38b5bea5e47a56e274681d637')

build() {
    python -m build -nw $_pkgname-$pkgver
}

check() {
    export PYTHONPATH=$srcdir/$_pkgname-$pkgver/src
    python -c 'import peft'
}

package() {
    cd $_pkgname-$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-py3-*-*.whl
}

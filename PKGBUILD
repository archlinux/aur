# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optimum'
_pkgname=${pkgname#python-}
pkgver=1.16.1
pkgrel=1
pkgdesc='Accelerate training and inference of transformers and diffusers with easy to use hardware optimization tools'
arch=('x86_64')
url='https://github.com/huggingface/optimum/'
license=('Apache')
depends=(
    'python-coloredlogs'
    'python-datasets'
    'python-huggingface-hub'
    'python-numpy'
    'python-pytorch'
    'python-sympy'
    'python-transformers'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    'python-datasets'
    'python-evaluate'
    'python-onnx'
    'python-onnxruntime'
)
groups=('huggingface')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/huggingface/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b753147664bdc1206a37956fad3b8c1675fcf430e20ea7f5cc1972bc0fc84e3c')

build() {
    cd $_pkgname-$pkgver
    python setup.py bdist_wheel
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

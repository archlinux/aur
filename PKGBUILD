# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optimum'
_pkgname=${pkgname#python-}
pkgver=1.18.1
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
    'python-packaging'
    'python-pytorch'
    'python-sentencepiece'
    'python-sympy'
    'python-transformers<4.40.0'
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
sha256sums=('fc1620e14bb43f679e89048c2b5c8442aaa4a75363b26b813ef5ef1f48e61ff3')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

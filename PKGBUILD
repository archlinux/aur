# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optimum'
_pkgname=${pkgname#python-}
pkgver=1.23.0
pkgrel=1
pkgdesc='Accelerate training and inference of transformers and diffusers with easy to use hardware optimization tools'
arch=('any')
url='https://github.com/huggingface/optimum'
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
sha256sums=('1b9e8381af187e5d74a4ddf3dc41d49449884bf2711daf4599ef4a76d579b0c2')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}

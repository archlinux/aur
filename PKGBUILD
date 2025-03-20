# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optimum'
_pkgname=${pkgname#python-}
pkgver=1.24.0
pkgrel=1
pkgdesc='Hardware optimization tools for training and inference of transformers and diffusers'
arch=('any')
url='https://github.com/huggingface/optimum'
license=('Apache-2.0')
depends=(
    'python-huggingface-hub'
    'python-numpy'
    'python-packaging'
    'python-pytorch'
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
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1547f0b4279cc2a2f0f3597b8c6489270b5f9a4e049e13c100d451aba8fbd53')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    cd $_pkgname-$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*-*.whl
}

# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optimum-onnx'
_pkgname=${pkgname#python-}
pkgver=0.0.3
pkgrel=1
pkgdesc='Optimum ONNX is an interface between the Hugging Face libraries and ONNX / ONNX Runtime'
arch=('any')
url='https://github.com/huggingface/optimum-onnx'
license=('Apache-2.0')
depends=(
    'python-huggingface-hub'
    'python-numpy'
    'python-packaging'
    'python-pytorch'
    'python-onnx'
    'python-optimum'
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
sha256sums=('86beb3249fe961fdfebdfcd232fc49e1b5c7d48c641aba133ca7c4b72e6a60c3')

build() {
    python -m build -nw ${_pkgname}-${pkgver}
}

package() {
    cd $_pkgname-$pkgver
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=${pkgdir} \
        dist/${_pkgname//-/_}-${pkgver}-*.whl
}

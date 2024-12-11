# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Maintainer: daskol (Daniel Bershatsky) < bepshatsky at yandex dot ru >

pkgname='python-datasets'
pkgver=3.2.0
pkgrel=1
pkgdesc='The largest hub of ready-to-use datasets for ML models with fast, easy-to-use and efficient data manipulation tools'
arch=('x86_64')
url='https://github.com/huggingface/datasets'
license=('Apache')
depends=(
    'python-aiohttp'
    'python-dill'
    'python-filelock'
    'python-fsspec>=2023.9.0'
    'python-huggingface-hub>=0.23.0'
    'python-multiprocess'
    'python-numpy'
    'python-packaging'
    'python-pandas'
    'python-pyarrow'
    'python-yaml'
    'python-requests'
    'python-tqdm'
    'python-xxhash'
)
makedepends=('python-build' 'python-hatchling' 'python-installer'
             'python-setuptools' 'python-wheel')
optdepends=(
    'python-librosa: Audio datasets'
    'python-pillow: Vision datasets'
    'python-tensorflow: TensorFlow support'
    'python-pytorch: PyTorch support'
)
groups=('huggingface')
source=("datasets-${pkgver}.tar.gz::https://github.com/huggingface/datasets/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1492c055060570085922053317855ffa37321950c14408fa6e08ae260b6ee5a1')

build() {
    python -m build -nw ${srcdir}/datasets-${pkgver}
}

check() {
    # Sanity check: import package.
    cd ${srcdir}/datasets-${pkgver}/src
    python -c "import datasets"
}

package() {
    cd ${srcdir}/datasets-${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --compile-bytecode 1 --destdir $pkgdir dist/*.whl
}

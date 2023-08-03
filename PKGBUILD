# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Maintainer: daskol (Daniel Bershatsky) < bepshatsky at yandex dot ru >

pkgname='python-datasets'
pkgver=2.14.3
pkgrel=1
pkgdesc='The largest hub of ready-to-use datasets for ML models with fast, easy-to-use and efficient data manipulation tools'
arch=('x86_64')
url='https://github.com/huggingface/datasets'
license=('Apache')
depends=(
    'python-aiohttp'
    'python-dill'
    'python-fsspec>=2021.11.1'
    'python-huggingface-hub'
    'python-multiprocess'
    'python-numpy>=1.17'
    'python-packaging'
    'python-pandas'
    'python-pyarrow>=6.0.0'
    'python-yaml>=5.1'
    'python-requests>=2.19.0'
    'python-tqdm>=4.62.1'
    'python-xxhash'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    'python-librosa: Audio datasets'
    'python-pillow: Vision datasets'
    'python-tensorflow: TensorFlow support'
    'python-pytorch: PyTorch support'
)
groups=('huggingface')
source=("datasets-${pkgver}.tar.gz::https://github.com/huggingface/datasets/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d2655af8040fc1c7e7e2c11d0fa847398e91c473308086b3622b9d13051419fa')

build() {
    python -m build -nw ${srcdir}/datasets-${pkgver}
}

package() {
    cd ${srcdir}/datasets-${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --compile-bytecode 1 --destdir $pkgdir dist/*.whl
}

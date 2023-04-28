# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Maintainer: daskol (Daniel Bershatsky) < bepshatsky at yandex dot ru >

pkgname='python-datasets'
pkgver=2.12.0
pkgrel=1
pkgdesc='The largest hub of ready-to-use datasets for ML models with fast, easy-to-use and efficient data manipulation tools'
arch=('x86_64')
url='https://github.com/huggingface/datasets'
license=('Apache')
depends=(
    'python-aiohttp'
    'python-dill'
    'python-fsspec>=2021.11.1'
    'python-huggingface-hub>=0.2.0'
    'python-huggingface-hub<1.0.0'
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
sha256sums=('19a0fd73499fa15148ebc650ec82c78096adcf0be597c5bedb308f29b98075aa')

build() {
    cd ${srcdir}/datasets-${pkgver}
    python -m build -n -w
}

package() {
    cd ${srcdir}/datasets-${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --compile-bytecode 1 --destdir $pkgdir dist/*.whl
}

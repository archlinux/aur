# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.7.1
pkgrel=2
pkgdesc="End-to-End Multi-Lingual Optical Character Recognition (OCR) Solution"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache")
depends=(
    'hdf5'
    'ninja'
    'python'
    'python-bidi'
    'python-numpy'
    'python-opencv'
    'python-torchvision>=0.5'
    'python-pillow'
    'python-pyaml'
    'python-pyclipper'
    'python-pytorch'
    'python-scikit-image'
    'python-scipy'
    'python-shapely'
)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(${depends[*]} 'python-pytorch-cuda')
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('8d56d59f020c501f1aeaa5876968747ca4b9e648f5510121aa180705b05b3efa369093237aa3bd3fec788cae462fa7d533393a55e6d1e5cfde02ef806c5a5e81')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python unit_test/run_unit_test.py \
        --easyocr ./easyocr \
        --verbose 2 \
        --test_data unit_test/data/EasyOcrUnitTestPackage.pickle \
        --image_data_dir ./examples
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

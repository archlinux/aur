# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.7.0
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
makedepends=('python-setuptools')
checkdepends=(${depends[*]} 'python-pytorch-cuda')
conflicts=('python-easyocr-git')
replaces=('python-easyocr-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5348be3e75a9b174b1881b134068d26ab7544db6084d1c97d29787ce1aefd550b95ed9f85a88a51d03ad22e7ae9d42c847ac3277c06e9bfa8f203ed3ac1ad558')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"
    python unit_test/run_unit_test.py \
        --easyocr ./easyocr \
        --verbose 2 \
        --test_data unit_test/data/EasyOcrUnitTestPackage.pickle \
        --image_data_dir ./examples
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

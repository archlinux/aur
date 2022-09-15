# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.6.2
pkgrel=5
pkgdesc="End-to-End Multi-Lingual Optical Character Recognition (OCR) Solution"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache-2.0")
depends=(
    'hdf5'
    'ninja'
    'python'
    'python-bidi'
    'python-numpy'
    'python-opencv'
    'python-torchvision'
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
provides=('python-easyocr')
conflicts=('python-easyocr-git')
replaces=('python-easyocr-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0ed5af2b739ce2303c5173d520b631df311d54a9aa58a80e09fe33d44c0a8115')

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
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

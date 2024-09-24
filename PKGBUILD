# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.7.2
pkgrel=1
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
    'python-pillow'
    'python-pyaml'
    'python-pyclipper'
    'python-pytorch'
    'python-scikit-image'
    'python-scipy'
    'python-shapely'
    'python-torchvision>=0.5'
)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(${depends[*]} python-pytorch-cuda) # disabled until CUDA is not needed anymore
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('de18bf6fbf615e0d49d3d9458a92263bf59abd9aec9bb549c055a41fb3abb7134e765ab602fd82915c52acefac298bead2e499924f063d7ab9fa8735d435dcfb')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

# check() {
#     cd $_name-$pkgver
#     python unit_test/run_unit_test.py \
#         --easyocr ./easyocr \
#         --verbose 2 \
#         --test_data unit_test/data/EasyOcrUnitTestPackage.pickle \
#         --image_data_dir ./examples
# }

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

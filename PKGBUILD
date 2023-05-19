# Maintainer: WhiredPlanck

pkgname=python-easyocr-git
_name=EasyOCR
_commit=19db7ba78903d79ffc7d789bd0427e8023525a02
pkgver=1.6.2.r594.19db7ba
pkgrel=1
pkgdesc="Ready-to-use OCR with 40+ languages supported including Chinese, Japanese, Korean and Thai"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache-2.0")
depends=(
         'python-torchvision>=0.5' 'python-scikit-image'
         'python-pytorch' 'python-opencv' 'python-bidi'
         'python-pillow' 'python-numpy' 'python-yaml'
         'python-shapely' 'python-pyclipper' 'python-scipy'
)
makedepends=('python-setuptools' 'git' 'ninja')
#checkdepends=('python-pytest-runner')
optdepends=('python-torchvision-cuda>=0.5')
provides=('python-easyocr')
conflicts=('python-easyocr')
replaces=('python-easyocr')
source=("git+https://github.com/JaidedAI/EasyOCR.git#commit=${_commit}")
sha256sums=('SKIP')
install=${pkgname}.install

# prepare() {
#     cd "$srcdir"/${_name} # -${pkgver}
#     sed -i "s/opencv-python//g" requirements.txt
#     #sed -i 's/Pillow<7.0/Pillow/g' setup.py
#     cd easyocr
#     sed -i '4d' detection.py
# }

build() {
    cd "$srcdir"/${_name}
    python setup.py build
}

package() {
    depends+=('python')
    cd ${_name} #-${pkgver}
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

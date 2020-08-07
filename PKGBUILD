# Maintainer: WhiredPlanck

pkgname=python-easyocr-git
_name=EasyOCR
pkgver=1.1.6.r297.a36bb9e
pkgrel=1
pkgdesc="Ready-to-use OCR with 40+ languages supported including Chinese, Japanese, Korean and Thai"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache")
depends=(
         'python-torchvision>=0.5' 'python-scikit-image'
         'python-pytorch' 'opencv' 'hdf5'
)
makedepends=('python-setuptools' 'git')
#checkdepends=('python-pytest-runner')
optdepends=('python-torchvision-cuda>=0.5')
provides=('python-easyocr')
conflicts=('python-easyocr')
replaces=('python-easyocr')
source=('git+https://github.com/JaidedAI/EasyOCR.git')
sha256sums=('SKIP')
install=${pkgname}.install

prepare() {
    cd "$srcdir"/${_name} # -${pkgver}
    sed -i "s/opencv-python//g" requirements.txt
    #sed -i 's/Pillow<7.0/Pillow/g' setup.py
    cd easyocr
    sed -i '4d' detection.py
}

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

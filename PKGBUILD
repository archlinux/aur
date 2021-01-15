# Maintainer: WhiredPlanck

pkgname=python-easyocr
_name=EasyOCR
pkgver=1.2.2
pkgrel=1
pkgdesc="Ready-to-use OCR with 40+ languages supported including Chinese, Japanese, Korean and Thai"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache-2.0")
depends=('python-torchvision' 'python-pytorch' 'python-scikit-image'
         'python-pillow' 'python-numpy' 'opencv' 'hdf5' 'python-scipy' 'python-bidi' 'python-pyaml')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner' 'python-tornado' 'python-nose' 'python-psutil' 'python-trustme'
#              'python-gcp-devrel-py-tools' 'python-pytest-timeout' 'python-flaky')
provides=('python-easyocr')
conflicts=('python-easyocr-git')
replaces=('python-easyocr-git')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(#'42d65f0da9cde6b1b183b6fdebdc8e077ad03deeb6b0b622fa5926c2f31bed7f'
            'SKIP')
install=${pkgname}.install

build() {
    #cd "$srcdir"/${_name}-${pkgver}
    #sed -i "s/,'opencv-python'//g" setup.py
    #sed -i 's/Pillow<7.0/Pillow/g' setup.py
    #cd easyocr
    #sed -i '4d' detection.py
    cd "$srcdir"/${_name}-${pkgver}
    python setup.py build
}

package() {
    depends+=('python')
    cd ${_name}-${pkgver}
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

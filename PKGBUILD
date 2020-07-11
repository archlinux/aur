# Maintainer: WhiredPlanck

pkgname=python-easyocr-git
_name=EasyOCR
pkgver=1.1.3.r163.e918f92
pkgrel=1
pkgdesc="Ready-to-use OCR with 40+ languages supported including Chinese, Japanese, Korean and Thai"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache-2.0")
depends=('python-torchvision' 'python-pytorch' 'python-scikit-image'
         'python-pillow' 'python-numpy' 'opencv' 'hdf5' 'python-scipy')
makedepends=('python-setuptools' 'git')
#checkdepends=('python-pytest-runner' 'python-tornado' 'python-nose' 'python-psutil' 'python-trustme'
#              'python-gcp-devrel-py-tools' 'python-pytest-timeout' 'python-flaky')
provides=('python-easyocr')
conflicts=('python-easyocr')
replaces=('python-easyocr')
source=('git+https://github.com/JaidedAI/EasyOCR.git')
sha256sums=('SKIP')
install=${pkgname}.install

prepare() {
  cd "$srcdir"/${_name} # -${pkgver}
  sed -i "s/,'opencv-python'//g" setup.py
  sed -i 's/Pillow<7.0/Pillow/g' setup.py
  cd easyocr
  sed -i '4d' detection.py
}

package() {
  depends+=('python')
  cd ${_name} #-${pkgver}
  python setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

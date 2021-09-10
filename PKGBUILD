# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

_name=paddleocr
_gitname=PaddleOCR
pkgname=$_name-git
pkgver=r2924.f0fc9933
pkgrel=1
pkgdesc="Awesome multilingual OCR toolkits based on PaddlePaddle"
url="https://github.com/PaddlePaddle/PaddleOCR"
depends=(
    'python-shapely'
    'python-scikit-image'
    'python-imgaug'
    'python-pyclipper'
    'python-lmdb'
    'python-tqdm'
    'visualdl'
    'python-levenshtein'
    'python-opencv'
    'python-lxml'
    'python-premailer'
    'python-openpyxl'
    'paddlepaddle'
)
makedepends=('python-setuptools' 'git')
provides=($_name)
conflicts=($_name)
license=('Apache')
arch=('any')
source=(git+$url.git)
md5sums=('SKIP')

prepare() {
    cd $srcdir/$_gitname
    sed -i '/opencv-contrib-python/d;s|==|>=|' requirements.txt
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/${_gitname}
    python setup.py build
}

package() {
    cd $srcdir/${_gitname}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

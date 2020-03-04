# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname='python-detectron2'
_reponame='detectron2'
pkgver='r304.5e2a1ec'
pkgrel='1'
pkgdesc="Detectron2 is Facebook AI Research's next generation software system that implements state-of-the-art object detection algorithms."
arch=('any')
url='https://github.com/facebookresearch/detectron2'
license=('Apache-2.0')
provides=("${pkgname%-git}")
depends=(
  'python'
  'python-setuptools'
  'python-pytorch'
  'python-torchvision'
  'python-cocoapi'
)
optdepends=('opencv')
source=("${_reponame}::git+https://github.com/facebookresearch/detectron2.git")
sha256sums=('SKIP')

pkgber() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_reponame}"
  python setup.py build
}


package() {
  cd "${srcdir}/${_reponame}"
  python setup.py install --root="${pkgdir}"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

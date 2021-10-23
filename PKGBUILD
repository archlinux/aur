# Contributor: jerry73204 <jerry73204@gmail.com>

pkgname='python-detectron2-git'
_reponame='detectron2'
pkgver=0.5.r85.ga24729ab
pkgrel=1
pkgdesc="Detectron2 is Facebook AI Research's next generation software system that implements state-of-the-art object detection algorithms."
arch=('x86_64')
url='https://github.com/facebookresearch/detectron2'
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('python-torchvision' 'python-cocoapi')
makedepends=('git' 'python-setuptools')
source=("${_reponame}::git+https://github.com/facebookresearch/detectron2.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_reponame}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_reponame}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_reponame}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

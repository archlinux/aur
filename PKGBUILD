# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=('python-cocoapi-git' 'python2-cocoapi-git')
_pkgname='cocoapi-git'
pkgver=r193.ed842bf
pkgrel=1
pkgdesc='COCO is a large image dataset designed for object detection, segmentation, person keypoints detection, stuff segmentation, and caption generation.'
arch=('x86_64')
url='https://github.com/cocodataset/cocoapi'
license=('BSD')
makedepends=('git' 'python' 'python2')
source=("${_pkgname%-git}"::'git+https://github.com/cocodataset/cocoapi.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build_python-cocoapi-git() {
  cd "${srcdir}/${_pkgname%-git}/PythonAPI"
  python setup.py build
}

build_python2-cocoapi-git() {
  cd "${srcdir}/${_pkgname%-git}/PythonAPI"
  python2 setup.py build
}

package_python-cocoapi-git() {
  depends=('python')
  provides=('python-cocoapi')
  conflicts=('python-cocoapi')

  cd "${srcdir}/${_pkgname%-git}/PythonAPI"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-cocoapi-git() {
  depends=('python2')
  provides=('python2-cocoapi')
  conflicts=('python2-cocoapi')

  cd "${srcdir}/${_pkgname%-git}/PythonAPI"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

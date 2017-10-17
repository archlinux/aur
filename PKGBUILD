# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname='openface-git'
_pkgname='openface'
pkgver='ac4ded4'
pkgrel=1
pkgdesc='Face recognition with deep neural networks.'
arch=('x86_64')
url='http://cmusatyalab.github.io/openface/'
license=('Apache')
depends=('graphicsmagick'
         'openssl'
         'libffi'
         'python'
         'python-pip'
         'python-numpy'
         'python-nose'
         'python-scipy'
         'python-pandas'
         'python-protobuf'
         'python-sslib'
         'wget'
         'zip'
         'python-dlib'
         'opencv')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname::'git+https://github.com/cmusatyalab/openface')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git rev-parse HEAD | cut -c 1-7
}

build() {
  cd $_pkgname
  ./models/get-models.sh

  mkdir -p build
  python setup.py install --root="$srcdir/$_pkgname/build/"
}

package() {
  cp -r $srcdir/$_pkgname/build/usr $pkgdir
}

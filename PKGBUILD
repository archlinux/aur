# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-minieigen-git')
pkgdesc="Boost::Python wrapper for parts of the Eigen c++ library"
pkgver=20190218.3cf33d9
pkgrel=2
license=('LGPL3')
url='https://github.com/eudoxos/minieigen'
arch=('x86_64')
makedepends=('git' 'boost' 'eigen' 'python>=3.5')
depends=('boost' 'eigen' 'python>=3.5')
source=("${pkgname}::git+${url}.git"
  "0001-${pkgname}.patch")
md5sums=('SKIP'
         '66fe70ea9503812c1bc48f63ce14b832')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 <"${srcdir}/0001-${pkgname}.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --skip-build
}

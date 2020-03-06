# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-minieigen-git')
pkgdesc="Boost::Python wrapper for parts of the Eigen c++ library"
pkgver=20200217.1e992b1
pkgrel=1
license=('LGPL3')
url='https://github.com/eudoxos/minieigen'
arch=('x86_64')
makedepends=('git' 'boost' 'eigen' 'python')
depends=('boost' 'python-distro' 'eigen' 'python')
source=("${pkgname}::git+${url}.git"
  "0001-Fix-distro-check.patch")
md5sums=('SKIP'
         '2ff02b2a7d24e567d33233e0aaa2aecd')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 <"${srcdir}/0001-Fix-distro-check.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --skip-build
}

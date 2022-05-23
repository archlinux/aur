# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando-git
pkgver=1.0.0.r214.gfdfb2e6d3
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together, including Cando"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'fmt' 'gmp' 'libbsd' 'libedit' 'clang' 'zeromq'
         'libelf' 'libffi' 'llvm' 'netcdf' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'ninja' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
conflicts=('clasp-cl-git')
source=('git+https://github.com/clasp-developers/clasp.git')
sha512sums=('SKIP')

pkgver() {
  cd clasp
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd clasp
  ./koga --package-path=$pkgdir --extensions=cando,seqan-clasp --jupyter --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/ --jupyter-path=/usr/share/jupyter/
  ninja -C build
}

package() {
  cd clasp
  ninja -C build install
}


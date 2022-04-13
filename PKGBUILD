# Maintainer: Tarn W. Burton <twburton@gmail.com>
_srcname=clasp
pkgname=clasp-cl-git
pkgver=1.0.0.r42.gc4bff433a
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'gmp' 'libbsd' 'libedit' 'clang' 'zeromq' 'seqan'
         'libelf' 'libffi' 'llvm' 'netcdf' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'ninja')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
source=('git+https://github.com/clasp-developers/clasp.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname/"
  ./koga --package-path $pkgdir --extensions cando,seqan-clasp --jupyter --prefix /usr/
  ninja -C build
}

package() {
  cd "$_srcname/"
  ninja -C build install
}


# Maintainer: Tarn W. Burton <twburton@gmail.com>
_srcname=clasp
pkgname=clasp-cl-git
pkgver=1.0.0.r107.g88fb4bb9d
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'fmt' 'expat' 'gmp' 'libbsd' 'libedit' 'clang' 'zeromq' 'seqan'
         'libelf' 'libffi' 'llvm' 'netcdf' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'ninja' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
source=('git+https://github.com/clasp-developers/clasp.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname/"
  ./koga --package-path=$pkgdir --extensions=cando,seqan-clasp --jupyter --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/ --jupyter-path=/usr/share/jupyter/
  ninja -C build
}

package() {
  cd "$_srcname/"
  ninja -C build install
}


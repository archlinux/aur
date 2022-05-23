# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clasp-cl-git
pkgver=1.0.0.r214.gfdfb2e6d3
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'fmt' 'gmp' 'libbsd' 'libedit' 'clang'
         'libelf' 'libffi' 'llvm' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'ninja' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl')
conflicts=('cando-git')
source=('git+https://github.com/clasp-developers/clasp.git')
sha512sums=('SKIP')

pkgver() {
  cd clasp
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd clasp
  ./koga --package-path=$pkgdir --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ninja -C build
}

package() {
  cd clasp
  ninja -C build install
}


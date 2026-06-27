# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=3.0.1
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together, including Cando"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'fmt' 'gmp' 'libbsd' 'libedit' 'clang19' 'zeromq'
         'libelf' 'libffi' 'llvm19' 'netcdf' 'ninja' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
conflicts=('cando-git' 'clasp-cl' 'clasp-cl-git')
source=("https://github.com/clasp-developers/clasp/releases/download/$pkgver/clasp-$pkgver.tar.gz")
sha512sums=('b532ab98dfe98fb2b564bb84cd175bc99a32c185b966bbc4bb375b8aa16b85fa71efd8af989064c655cfa9dff679e5d5ba52be3ee42cb693a099474bd29a1d13')

build() {
  cd clasp-$pkgver
  ./koga \
    --skip-sync \
    --reproducible-build \
    --package-path=$pkgdir \
    --extensions=cando,seqan-clasp \
    --bin-path=/usr/bin/ \
    --share-path=/usr/share/clasp/ \
    --lib-path=/usr/lib/clasp/ \
    --dylib-path=/usr/lib/
  ninja -C build
}

package() {
  cd clasp-$pkgver
  ninja -C build install
}

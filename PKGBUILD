# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=mingw-w64-readerwriterqueue-git
pkgver=r77.66a9b18
pkgrel=3
pkgdesc="A fast single-producer, single-consumer lock-free queue for C++. (mingw-w64)"
arch=('any')
url='https://github.com/cameron314/readerwriterqueue'
license=('Simplified BSD License')
depends=('mingw-w64-crt')
makedepends=('git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname%-git}::git+https://github.com/cameron314/readerwriterqueue.git#branch=master")
sha1sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    echo "done"
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname%-git}"
    INCDIR="${pkgdir}/usr/${_arch}/include/readerwriterqueue"
    mkdir -p "${INCDIR}"
    cp readerwriterqueue.h atomicops.h "${INCDIR}/"
    chmod -R a+r "${INCDIR}"
#    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
#    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
 
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

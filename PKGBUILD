# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=2.7.0
pkgrel=3
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
sha512sums=('d2a7c4011c9b03bfd0b47ae9f677738a67c5684069ba0b9ed96dcbb38cdd7d769747b8e2b2872c377f8559f70432f131315d7d60afd590660bb4aa1444b3482c')

build() {
  cd clasp-$pkgver
  ./koga \
    --skip-sync \
    --build-mode=bytecode-faso \
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

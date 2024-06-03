# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=2.6.0
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together, including Cando"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'fmt' 'gmp' 'libbsd' 'libedit' 'clang' 'zeromq'
         'libelf' 'libffi' 'llvm' 'netcdf' 'ninja' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
conflicts=('cando-git' 'clasp-cl' 'clasp-cl-git')
source=("https://github.com/clasp-developers/clasp/releases/download/$pkgver/clasp-$pkgver.tar.gz")
sha512sums=('53eb0c6ec958435d70d6f89600076700b6e66d889491d71b207580b78570c9a53961fbc38daba43a3703cb645d0c9fcfa78105436d09e5d547ab5bb943886042')

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
    --lib-path=/usr/lib/clasp/
  ninja -C build
}

package() {
  cd clasp-$pkgver
  ninja -C build install
}

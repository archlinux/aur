# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=2.5.0
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
source=("https://github.com/clasp-developers/clasp/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('47996a938682a5a377a090d22e961dc19d9682dd925f064ac4230aca0ab1a439ad3a51528d89cd798224d8644bc3e45eaa7802fc3e9ec0188bc72694f88b1556')

build() {
  cd clasp-$pkgver
  ./koga --reproducible-build --broken-stdlib --package-path=$pkgdir --extensions=cando,seqan-clasp --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ninja -C build
}

package() {
  cd clasp-$pkgver
  ninja -C build install
}

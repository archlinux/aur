# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=2.3.0
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
sha512sums=('e0e22791d9008c1caf197f1b7b40c304132af8d96925ab54dc8c0fd62ae928d72c3de1f2af5e3dcd6428061aa8554613083b589750f808fa02fcfa5f9252786d')

build() {
  cd clasp-$pkgver
  ./koga --reproducible-build --broken-stdlib --package-path=$pkgdir --extensions=cando,seqan-clasp --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ninja -C build
}

package() {
  cd clasp-$pkgver
  ninja -C build install
}

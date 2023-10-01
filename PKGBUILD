# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=2.4.0
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
sha512sums=('5cb3642fbfe5f936e733cae95b4746d86fec9af6017b04ccd6b87eded4f80eae48c2965af104688eaa54648ec99b21a79bf0f0f69637eab8ca7a909dd9987832')

build() {
  cd clasp-$pkgver
  ./koga --reproducible-build --broken-stdlib --package-path=$pkgdir --extensions=cando,seqan-clasp --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ninja -C build
}

package() {
  cd clasp-$pkgver
  ninja -C build install
}

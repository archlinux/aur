# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=2.1.0
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
sha512sums=('0927b83aaa16bc36618d6d752b23b14f191cc64b223b5097f39007724440aee7bff740353660ec95ab18b80aad2d8237e0311e806f77e516efe0129f71240523')

build() {
  cd clasp-$pkgver
  ./koga --reproducible-build --broken-stdlib --package-path=$pkgdir --extensions=cando,seqan-clasp --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ninja -C build
}

package() {
  cd clasp-$pkgver
  ninja -C build install
}

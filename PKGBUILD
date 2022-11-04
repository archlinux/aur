# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando
pkgver=2.0.0
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
conflicts=('clasp-cl-git')
source=('https://github.com/clasp-developers/clasp/archive/refs/tags/2.0.0.tar.gz')
sha512sums=('79a14366aa8f4cbf079a9f961dd2b3eed95ec3a47b27ffa729da2eb70be6e688b404a62b913a18ec5c4dcb217b9e8e807d71d64f6744abca8cdf6d71689a15f9')

prepare() {
  cd clasp-$pkgver
  ./koga --reproducible-build --broken-stdlib --package-path=$pkgdir --extensions=cando,seqan-clasp --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ./koga --skip-sync --extensions=cando,seqan-clasp --update-version
}

build() {
  cd clasp-$pkgver
  ninja -C build
}

package() {
  cd clasp-$pkgver
  ninja -C build install
}

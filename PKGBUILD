# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando-git
pkgver=2.5.0.r1.g9f74f94ba.gfc99a3fa
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
conflicts=('cando' 'clasp-cl' 'clasp-cl-git')
source=('git+https://github.com/clasp-developers/clasp.git'
        'pkgver.lisp')
sha512sums=('SKIP'
            '4c6092823f538bca39176944e913904c6a86a12934d27a641eeaec0cd8f1b8cdd3d8acfc86ef0a6f676869930edf29b0f900ac48e647385fece9544150bb2db5')

prepare() {
  cd clasp
  ./koga --reproducible-build --package-path=$pkgdir --extensions=cando,seqan-clasp --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/ --skip-sync=ansi-test,mps,cl-bench,cl-who
  ./koga --skip-sync --extensions=cando,seqan-clasp --update-version
}

pkgver() {
  cd clasp
  sbcl --noinform --non-interactive --load ../../pkgver.lisp
}

build() {
  cd clasp
  ninja -C build
}

package() {
  cd clasp
  ninja -C build install
}

# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clasp-cl-git
pkgver=2.5.0.r1.g9f74f94ba
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'fmt' 'gmp' 'libbsd' 'libedit' 'clang'
         'libelf' 'libffi' 'llvm' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'ninja' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl')
conflicts=('cando' 'cando-git' 'clasp-cl')
source=('git+https://github.com/clasp-developers/clasp.git'
        'pkgver.lisp')
sha512sums=('SKIP'
            '731cad012e1a572128746ae9839dfe347e509cc2d4a5375a62ee92dbe88f1b601d032eafe82e6fc10d62932c95c72dbde63ecf43be7c5a979128a2e119b8fa32')

prepare() {
  cd clasp
  ./koga --reproducible-build "--package-path=$pkgdir" -bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/ --skip-sync=ansi-test,mps,cl-bench,cl-who
  ./koga --skip-sync --update-version
}

pkgver() {
  cd clasp
  sbcl --noinform --non-interactive --load ../pkgver.lisp
}

build() {
  cd clasp
  ninja -C build
}

package() {
  cd clasp
  ninja -C build install
}


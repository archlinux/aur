# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=3.0.1
pkgrel=2
pkgdesc='Bringing Common Lisp and C++ Together'
arch=('x86_64')
url='https://github.com/clasp-developers/clasp'
license=('LGPL')
depends=(
  'boost'
  'expat'
  'fmt'
  'gmp'
  'libbsd'
  'libedit'
  'clang'
  'libelf'
  'libffi'
  'llvm'
  'ncurses'
  'zlib'
)
makedepends=('git' 'sbcl' 'ninja')
provides=('cclasp-boehm' 'clasp-cl' 'common-lisp')
conflicts=('cando' 'cando-git' 'clasp-cl-git')
options=('!strip')
source=("https://github.com/clasp-developers/clasp/releases/download/$pkgver/clasp-$pkgver.tar.gz")
sha512sums=('b532ab98dfe98fb2b564bb84cd175bc99a32c185b966bbc4bb375b8aa16b85fa71efd8af989064c655cfa9dff679e5d5ba52be3ee42cb693a099474bd29a1d13')
b2sums=('99e5b598972a19dde3c3b81d5bdde62ed196f7054db0c03fc639be543da3b4a4ad563fef3cf9ee7b0aad8f9dbd2f8d38413e5d134f52428f1ccc8e9181365163')

build() {
  cd clasp-$pkgver

  ./koga \
    --skip-sync \
    --reproducible-build \
    --package-path=$pkgdir \
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

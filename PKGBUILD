# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.7.0
pkgrel=3
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
  'clang19'
  'libelf'
  'libffi'
  'llvm19'
  'ncurses'
  'zlib'
)
makedepends=('git' 'sbcl' 'ninja')
provides=('cclasp-boehm' 'clasp-cl' 'common-lisp')
conflicts=('cando' 'cando-git' 'clasp-cl-git')
options=('!strip')
source=("https://github.com/clasp-developers/clasp/releases/download/$pkgver/clasp-$pkgver.tar.gz")
sha512sums=('d2a7c4011c9b03bfd0b47ae9f677738a67c5684069ba0b9ed96dcbb38cdd7d769747b8e2b2872c377f8559f70432f131315d7d60afd590660bb4aa1444b3482c')
b2sums=('9fe1df7357684addfae3825502d2cce9f7e49ca99d6bb6c51415bfb76fc0fb5c162129b1430aec969b23865930df8e382a2f6735ca4d3945955675d47081dd19')

build() {
  cd clasp-$pkgver

  ./koga \
    --skip-sync \
    --build-mode=bytecode-faso \
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

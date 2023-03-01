# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.2.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/clasp-developers/clasp/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('12fe3ce190e4abbc1c9c3ec81bdc7fb478514adf91ec709a6c21aeb750cfe02cc1722e840eaa0d03ae2ac2739f9825fde13e39590d4bba3780efc8404e1c1f5d')
b2sums=('0d38403a32367278e3ded69aa1b8a8a1b04d89128e64deebeef9fdcc895f4b2ff5c7651c7a25ece6cdbcbf7501789893af222d88d63fbf842dd57a8b829ab095')

build() {
  cd clasp-$pkgver

  ./koga \
    --reproducible-build \
    --broken-stdlib \
    --package-path=$pkgdir \
    --bin-path=/usr/bin/ \
    --share-path=/usr/share/clasp/ \
    --lib-path=/usr/lib/clasp/

  ninja -C build
}

package() {
  cd clasp-$pkgver

  ninja -C build install
}

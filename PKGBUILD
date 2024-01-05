# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.5.0
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
sha512sums=('47996a938682a5a377a090d22e961dc19d9682dd925f064ac4230aca0ab1a439ad3a51528d89cd798224d8644bc3e45eaa7802fc3e9ec0188bc72694f88b1556')
b2sums=('52d42b0da0704da53235d313fe525923f467946d96ee511a1186f8da5e263706b9bedcd9562138f50c32a9d171b9a19be647cc155a9c55d3289fe992dba4b6e8')

build() {
  cd clasp-$pkgver

  ./koga \
    --build-mode=bytecode-faso \
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

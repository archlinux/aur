# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.6.0
pkgrel=1
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
sha512sums=('53eb0c6ec958435d70d6f89600076700b6e66d889491d71b207580b78570c9a53961fbc38daba43a3703cb645d0c9fcfa78105436d09e5d547ab5bb943886042')
b2sums=('2c433de007bf1a54ecebc046cb46fd8e64b35ea82a267059a4232b2ca916fceb48315c784f2b3057b14f86051f5698e889b34f55432a5701316d7f955655a278')

build() {
  cd clasp-$pkgver

  ./koga \
    --skip-sync \
    --build-mode=bytecode-faso \
    --reproducible-build \
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

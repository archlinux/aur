# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.0.0
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
source=("https://github.com/clasp-developers/clasp/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('79a14366aa8f4cbf079a9f961dd2b3eed95ec3a47b27ffa729da2eb70be6e688b404a62b913a18ec5c4dcb217b9e8e807d71d64f6744abca8cdf6d71689a15f9')

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

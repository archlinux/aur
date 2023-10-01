# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.4.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/clasp-developers/clasp/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('5cb3642fbfe5f936e733cae95b4746d86fec9af6017b04ccd6b87eded4f80eae48c2965af104688eaa54648ec99b21a79bf0f0f69637eab8ca7a909dd9987832')
b2sums=('743e409e1b90882c544c040ca0b98b591edb12aab7d26f6e20475cec3095c94e6e820b40701a79e9374538a7beb2dec24fd127b1931b8b390e8872c3f2182f4f')

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

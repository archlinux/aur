# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.1.0
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
sha512sums=('0927b83aaa16bc36618d6d752b23b14f191cc64b223b5097f39007724440aee7bff740353660ec95ab18b80aad2d8237e0311e806f77e516efe0129f71240523')
b2sums=('dc30dade4f02f80814f55fe4d0df54393b69eaca7025108ef412044a33272a53665d1f89d93fa5f961fb3f939e82047cca7ad85e048d805b9f2e9120fbb75f90')

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

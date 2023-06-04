# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.3.0
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
sha512sums=('e0e22791d9008c1caf197f1b7b40c304132af8d96925ab54dc8c0fd62ae928d72c3de1f2af5e3dcd6428061aa8554613083b589750f808fa02fcfa5f9252786d')
b2sums=('5d7ab74502ec892d5caaf339b52db7bbbf5f24ed8e80a44bf7509d556a448f761c17cf489bcbd14019552a4facae81200c62f37c7e147016ea9d67ba6b57fe32')

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

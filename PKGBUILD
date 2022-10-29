# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Tarn W. Burton <twburton@gmail.com>

pkgname=clasp-cl
pkgver=2.0.0
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
provides=('cclasp-boehm' 'clasp-cl' 'common-lisp' 'cl-asdf')
options=('!strip')
_commit='413757e24a5fbf84195434ec545602db0a8840a0'
source=("$pkgname::git+https://github.com/clasp-developers/clasp#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

build() {
  cd "$pkgname"

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
  cd "$pkgname"

  ninja -C build install
}

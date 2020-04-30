# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=protobuf
pkgname=cl-${_srcname}-git
pkgver=r134.fdc3af4
pkgrel=1
pkgdesc="Protobuf is a Common Lisp implementation of Google's protocol buffers."
arch=('x86_64')
url="https://github.com/brown/protobuf"
license=('BSD')
optdepends=('boost' 'protobuf')
depends=()
makedepends=('git' 'make')
provides=("cl-${_srcname}")
# source=('git://github.com/brown/protobuf.git')
# Temporarily until https://github.com/brown/protobuf/pull/19 is resolved.
source=('git://github.com/eschulte/protobuf.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_srcname/protoc/lisp/"
    cp /usr/include/google/protobuf/stubs/strutil.h .
    INSTALL_ROOT=/usr/ PROTOC_ROOT=/usr/ make
}

package() {
  cd "$_srcname/protoc/lisp/"
  mkdir -p "$pkgdir"/usr
  INSTALL_ROOT="$pkgdir"/usr/ PROTOC_ROOT=/usr/ make install
}

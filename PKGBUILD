# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libfreeaptx
pkgver=0.1.1
pkgrel=1
pkgdesc="Open Source aptX codec library"
url="https://github.com/iamthehorker/libfreeaptx"
arch=(x86_64)
license=(LGPL)
depends=(glibc)
makedepends=(git)
provides=(libfreeaptx.so)
_commit=0485c73bc12f1f860d892bb7166730b3412395bd  # tags/0.1.1^0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

_make() {
  make CPPFLAGS="$CPPFLAGS" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    PREFIX=/usr "$@"
}

build() {
  cd $pkgname
  _make
}

package() {
  cd $pkgname
  _make DESTDIR="$pkgdir" install
}

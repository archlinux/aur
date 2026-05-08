pkgname=qpxtool-unofficial-git
pkgver=r157.f35f02a
pkgrel=1
pkgdesc="Enhanced (unofficial) qpxtool version"
arch=('x86_64')
url="https://github.com/speed47/qpxtool"
license=('GPL')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')

source=("git+https://github.com/speed47/qpxtool.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/qpxtool"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/qpxtool"
}

build() {
  cd "$srcdir/qpxtool"
  export CFLAGS+=" -fno-strict-aliasing"
  ./configure --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir/qpxtool"
  make DESTDIR="$pkgdir" install
}

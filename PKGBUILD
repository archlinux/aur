# Maintainer: Joseph Diza <josephm.diza@gmail.com>
pkgname=logc-git
pkgver=f9ea349
pkgrel=1
arch=('any')
pkgdesc='A simple logging library implemented in C99' 
url='https://github.com/rxi/log.c'
license=('GPL3')
depends=()
optdepends=()
makedepends=('git' 'make')
source=("$pkgname::git+https://github.com/rxi/log.c#branch=master")
provides=(logc)
conflicts=(logc)
sha512sums=("SKIP")

build() {
  cd "$pkgname"
  cd src
  relflags="-O3 -DNDEBUG"
  gcc -c $relflags -fPIC -Wl,soname,liblogc.so -o logc.o log.c -DLOG_USE_COLOR
  gcc -shared -o liblogc.so logc.o
}

package-lib() {
    # Install the shared library and library header
    LIB_DIR="$pkgdir"/usr/lib
    HEADER_DIR="$pkgdir"/usr/include
    mkdir -p $LIB_DIR
    mkdir -p $HEADER_DIR
    install liblogc.so "$LIB_DIR"
    install log.h "$HEADER_DIR"
}


package() {
  cd "$pkgname"
  cd src
  package-lib
}

# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbacktrace-git
pkgver=r21.5a99ff7
pkgrel=1
pkgdesc="Library to produce symbolic backtraces"
arch=('i686' 'x86_64')
url="https://github.com/ianlancetaylor/libbacktrace"
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'libunwind')
provides=('libbacktrace')
conflicts=('libbacktrace')
options=('staticlibs')
source=("git+https://github.com/ianlancetaylor/libbacktrace.git")
sha256sums=('SKIP')


pkgver() {
  cd "libbacktrace"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "libbacktrace"

  ./configure \
    --prefix="/usr" \
    --with-system-libunwind
  make
}

check() {
  cd "libbacktrace"

  #make check
}

package() {
  cd "libbacktrace"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libbacktrace/LICENSE"
}

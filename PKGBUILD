#PKGBUILD was last modified on September 27, 2022 at 03:55 PM EDT by bms#
# Maintainer: Ben Sutter <benjaminsutter@outlook.com>
pkgname=remake-git
pkgver=r3131.7619a012
pkgrel=1
pkgdesc="Enhanced GNU Make - tracing, error reporting, debugging, profiling and more"
arch=('i686' 'x86_64' 'aarch64')
url="http://bashdb.sourceforge.net/remake/"
license=('GPL3')
provides=("remake=$pkgver")
depends=('glibc' 'guile')
makedepends=('git' 'patch')
source=("${pkgname%-git}::git+https://github.com/rocky/remake.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  autoreconf -fi
  ./configure --disable-nls --with-guile --prefix=/usr
  (cd doc && make stamp-1 stamp-vti)
}

build() {
  cd "${pkgname%-git}"
  make
}

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/share/info/make.info{,-1,-2}
}
#end

# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=liburing-git
pkgver=0.3
pkgrel=1
pkgdesc="Linux-native io_uring I/O access library (git-version)"
arch=(x86 x86_64)
url="http://git.kernel.dk/cgit/liburing/"
license=('LGPL2.1')
provides=(liburing liburing.so)
conflicts=(liburing liburing.so)
source=("$pkgname::git+http://git.kernel.dk/liburing")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^liburing-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir/" make install
}

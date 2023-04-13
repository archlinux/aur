# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=strace-git
pkgver=6.2.r12.gd3b97fce7
pkgrel=1
pkgdesc="A diagnostic, debugging and instructional utility"
arch=('i686' 'x86_64')
url="https://strace.io/"
license=('BSD')
depends=('glibc' 'libunwind')
optdepends=('perl')
makedepends=('git')
provides=("strace=$pkgver")
conflicts=('strace')
source=("git+https://github.com/strace/strace.git")
sha256sums=('SKIP')


pkgver() {
  cd "strace"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "strace"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --with-libunwind
  make
}

check() {
  cd "strace"

  make check
}

package() {
  cd "strace"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/strace"
}

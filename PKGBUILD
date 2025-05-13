# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=inotify-tools-git
pkgver=4.23.9.0.r16.g81c6c98
pkgrel=1
pkgdesc="C library and a set of command-line programs for Linux providing a simple interface to inotify"
arch=('i686' 'x86_64')
url="https://github.com/inotify-tools/inotify-tools"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("inotify-tools=$pkgver")
conflicts=('inotify-tools')
options=('staticlibs')
source=("git+https://github.com/inotify-tools/inotify-tools.git")
sha256sums=('SKIP')


pkgver() {
  cd "inotify-tools"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "inotify-tools"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "inotify-tools"

  make check
}

package() {
  cd "inotify-tools"

  make DESTDIR="$pkgdir" install
}

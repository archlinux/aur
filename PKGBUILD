# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=inotify-tools-git
pkgver=3.22.6.0.r6.g8367bdd
pkgrel=1
pkgdesc="C library and a set of command-line programs for Linux providing a simple interface to inotify"
arch=('i686' 'x86_64')
url="https://github.com/rvoicilas/inotify-tools/wiki"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=("inotify-tools=$pkgver")
conflicts=('inotify-tools')
options=('staticlibs')
source=("git+https://github.com/rvoicilas/inotify-tools.git")
sha256sums=('SKIP')


pkgver() {
  cd "inotify-tools"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "inotify-tools"

  ./autogen.sh
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

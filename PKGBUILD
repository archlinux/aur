# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsigsegv-git
pkgver=2.11.r1.g4154472
pkgrel=2
pkgdesc="A library for handling page faults in user mode"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libsigsegv/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('libsigsegv')
conflicts=('libsigsegv')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/libsigsegv.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsigsegv"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libsigsegv"

  ./autogen.sh
  ./configure --prefix="/usr" --enable-shared
  make
}

check() {
  cd "libsigsegv"

  make check
}

package() {
  cd "libsigsegv"

  make DESTDIR="$pkgdir" install
}

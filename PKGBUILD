# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=libseccomp-git
pkgver=2.2.0.r223.g8ad3638
pkgrel=1
pkgdesc="Interface to the Linux Kernel's syscall filtering mechanism"
arch=('i686' 'x86_64')
url="https://github.com/seccomp/libseccomp"
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('libseccomp')
conflicts=('libseccomp')
options=('staticlibs')
source=("git+https://github.com/seccomp/libseccomp.git")
sha256sums=('SKIP')


pkgver() {
  cd "libseccomp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libseccomp"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libseccomp"

  #make check
}

package() {
  cd "libseccomp"

  make DESTDIR="$pkgdir" install
}

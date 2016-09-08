# Mantainer: Antonio Cardace <antonio@cardace.it>

pkgname=libs2argv-execs-git
_gitname=s2argv-execs
pkgver=0.1
pkgrel=1

pkgdesc="s2argv converts a command string into an argv array for execv, execvp, execvpe. execs is like execv taking a string instead of an argv."
arch=('x86_64' 'i686' 'arm')
url="https://github.com/rd235/s2argv-execs"
license=('GPL2')
makedepends=('autoconf' 'git')
provides=('libs2argv-execs')
conflicts=('libs2argv-execs')
source=("git://github.com/rd235/s2argv-execs.git" "Makefile.patch")
md5sums=('SKIP' 'b03e049f4c84ae941f78affc3373dc6f')

prepare() {
  cd "$srcdir/$_gitname"
  #patch as to not compile test files
  patch Makefile.am ../../Makefile.patch
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

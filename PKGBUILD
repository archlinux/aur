# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=make-git
pkgver=4.3.91.r0.g7c71df56
pkgrel=1
pkgdesc="A tool which controls the generation of executables and other non-source files of a program from the program's source files"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/make/"
license=('GPL3')
depends=('glibc' 'guile')
makedepends=('git' 'rsync' 'wget')
provides=("make=$pkgver")
conflicts=('make')
source=("git+https://git.savannah.gnu.org/git/make.git")
sha256sums=('SKIP')


pkgver() {
  cd "make"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "make"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --with-guile
  make
}

check() {
  cd "make"

  make check
}

package() {
  cd "make"

  make DESTDIR="$pkgdir" install
}

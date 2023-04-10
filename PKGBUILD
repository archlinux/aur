# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gawk-git
pkgver=5.2.1.r271.gc71ae933
pkgrel=1
pkgdesc="GNU version of awk"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gawk/"
license=('GPL3')
depends=('glibc' 'mpfr')
makedepends=('git')
provides=("gawk=$pkgver" 'awk')
conflicts=('gawk')
source=("git+https://git.savannah.gnu.org/git/gawk.git")
sha256sums=('SKIP')


pkgver() {
  cd "gawk"

  git describe --long --tags | sed 's/^gawk-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gawk"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr" \
    --without-libsigsegv
  make
}

check() {
  cd "gawk"

  make check
}

package() {
  cd "gawk"

  make DESTDIR="$pkgdir" install
}

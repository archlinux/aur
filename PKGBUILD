# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gsl-git
pkgver=2.6.r48.ga0f31bd6
pkgrel=1
pkgdesc="A numerical library for C and C++"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gsl/gsl.html"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('gsl')
conflicts=('gsl')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/gsl.git")
sha256sums=('SKIP')


pkgver() {
  cd "gsl"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gsl"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "gsl"

  make check
}

package() {
  cd "gsl"

  make DESTDIR="$pkgdir" install
}

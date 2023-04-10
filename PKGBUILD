# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gzip-git
pkgver=1.12.r42.g156d0e1
pkgrel=1
pkgdesc="A data compression program"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gzip/"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'rsync')
provides=("gzip=$pkgver")
conflicts=('gzip')
source=("git+https://git.savannah.gnu.org/git/gzip.git")
sha256sums=('SKIP')


pkgver() {
  cd "gzip"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gzip"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --disable-gcc-warnings
  make
}

check() {
  cd "gzip"

  make check
}

package() {
  cd "gzip"

  make DESTDIR="$pkgdir" install
}

# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=time-git
pkgver=1.9.r10.g59f462a
pkgrel=1
pkgdesc="Displays information about the resources used by other program"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/time/"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=("time=$pkgver")
conflicts=('time')
source=("git+https://git.savannah.gnu.org/git/time.git")
sha256sums=('SKIP')


pkgver() {
  cd "time"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "time"

  ./bootstrap || ./bootstrap  # workaround for faulty bootstrap script
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "time"

  make check
}

package() {
  cd "time"

  make DESTDIR="$pkgdir" install
}

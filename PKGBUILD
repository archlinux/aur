# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libcdio-paranoia-git
pkgver=10.2+0.94+2.r0.gda12cf5
pkgrel=1
pkgdesc="CD paranoia on top of libcdio"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libcdio/"
license=('GPL3')
depends=('glibc' 'libcdio')
makedepends=('git')
provides=('libcdio-paranoia')
conflicts=('libcdio-paranoia')
options=('staticlibs')
source=("git+https://github.com/rocky/libcdio-paranoia.git")
sha256sums=('SKIP')


pkgver() {
  cd "libcdio-paranoia"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libcdio-paranoia"

  autoreconf -fi
  ./configure --prefix="/usr" --disable-example-progs
  make
}

check() {
  cd "libcdio-paranoia"

  make check
}

package() {
  cd "libcdio-paranoia"

  make DESTDIR="$pkgdir" install
}

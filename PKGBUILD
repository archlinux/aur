# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=help2man-git
pkgver=1.47.13.r0.gfbec3d0
pkgrel=1
pkgdesc="Tool for generating manual pages from program output"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/help2man/"
license=('GPL')
depends=('perl-locale-gettext')
makedepends=('git' 'gettext' 'po4a')
provides=('help2man')
conflicts=('help2man')
source=("git+https://salsa.debian.org/bod/help2man.git")
sha256sums=('SKIP')


pkgver() {
  cd "help2man"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "help2man"

  automake -a || true
  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "help2man"

  make DESTDIR="$pkgdir" install
}

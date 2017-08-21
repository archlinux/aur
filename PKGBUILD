# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=twolame-git
pkgver=0.3.13.r100.gfb60b2e
pkgrel=1
pkgdesc="An optimised MPEG Audio Layer 2 (MP2) encoder"
arch=('i686' 'x86_64')
url="http://www.twolame.org/"
license=('LGPL2')
depends=('glibc' 'libsndfile')
makedepends=('git')
provides=('twolame')
conflicts=('twolame')
options=('staticlibs')
source=("git+https://github.com/njh/twolame.git")
sha256sums=('SKIP')


pkgver() {
  cd "twolame"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "twolame"

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix="/usr" --disable-maintainer-mode
  make
}

check() {
  cd "twolame"

  make check
}

package() {
  cd "twolame"

  make DESTDIR="$pkgdir" install
}

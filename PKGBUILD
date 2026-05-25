# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=twolame-git
pkgver=0.4.0.r6.g6fced85
pkgrel=1
pkgdesc="An optimised MPEG Audio Layer 2 (MP2) encoder"
arch=('i686' 'x86_64')
url="https://www.twolame.org/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libsndfile')
makedepends=('git' 'asciidoc' 'doxygen' 'xmlto')
provides=("twolame=$pkgver" 'libtwolame.so')
conflicts=('twolame')
options=('staticlibs')
source=("git+https://github.com/njh/twolame.git")
sha256sums=('SKIP')


prepare() {
  cd "twolame"

  sed -i 's|-Werror||g' "configure.ac"
}

pkgver() {
  cd "twolame"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "twolame"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-maintainer-mode
  make
}

check() {
  cd "twolame"

  #make check
}

package() {
  cd "twolame"

  make DESTDIR="$pkgdir" install
}

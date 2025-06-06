# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gperf-git
pkgver=3.3.r3.g4939b6b
pkgrel=1
pkgdesc="A perfect hash function generator"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gperf/"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("gperf=$pkgver")
conflicts=('gperf')
source=("git+https://git.savannah.gnu.org/git/gperf.git")
sha256sums=('SKIP')


pkgver() {
  cd "gperf"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gperf"

  ./gitsub.sh pull
  ./autogen.sh
  ./configure \
    --prefix="/usr"
  sed -i 's/	cd doc;/#	cd doc;/' "Makefile"  # skip over doc

  make
}

check() {
  cd "gperf"

  #make check
}

package() {
  cd "gperf"

  make DESTDIR="$pkgdir" install
}

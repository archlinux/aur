# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bison-git
pkgver=3.7.6.r328.g5c554ea8
pkgrel=1
pkgdesc="The GNU general-purpose parser generator"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/bison/bison.html"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'gperf' 'gzip' 'help2man' 'rsync' 'tar' 'wget')
provides=('bison')
conflicts=('bison')
source=("git+https://git.savannah.gnu.org/git/bison.git")
sha256sums=('SKIP')


prepare() {
  cd "bison"

  git submodule update --init "submodules/autoconf"
}

pkgver() {
  cd "bison"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bison"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "bison"

  make check
}

package() {
  cd "bison"

  make DESTDIR="$pkgdir" install
}

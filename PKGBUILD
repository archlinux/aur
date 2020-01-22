# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=indent-git
pkgver=2.2.12.r4.g14313ae
pkgrel=1
pkgdesc="C language source code formatting program"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/indent/"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'gperf' 'texi2html')
provides=('indent')
conflicts=('indent')
source=("git+https://git.savannah.gnu.org/git/indent.git")
sha256sums=('SKIP')


pkgver() {
  cd "indent"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "indent"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --enable-maintainer-mode
  CC_FOR_BUILD="gcc" make
}

check() {
  cd "indent"

  make check
}

package() {
  cd "indent"

  make DESTDIR="$pkgdir" docdir="/usr/share/doc/indent" install
}

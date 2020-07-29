# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gettext-git
pkgver=0.21.r4.g3564f5f88
pkgrel=1
pkgdesc="GNU internationalization library"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gettext/"
license=('GPL3')
depends=('glibc' 'glib2' 'gperf' 'libunistring' 'ncurses')
makedepends=('git' 'fpc' 'grep' 'help2man' 'wget' 'xz')
provides=('gettext')
conflicts=('gettext')
source=("git+https://git.savannah.gnu.org/git/gettext.git")
sha256sums=('SKIP')


prepare() {
  cd "gettext"

  git submodule update --init --recursive
}

pkgver() {
  cd "gettext"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gettext"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --without-gettext-tools
  make maintainer-update-po-local
}

check() {
  cd "gettext"

  make check
}

package() {
  cd "gettext"

  make DESTDIR="$pkgdir" install
}

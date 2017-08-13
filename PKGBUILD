# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gettext-git
pkgver=0.19.8.1.r59.g488bf1c3b
pkgrel=1
pkgdesc="GNU internationalization library"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gettext/"
license=('GPL3')
depends=('glibc' 'glib2' 'libunistring' 'ncurses')
makedepends=('git' 'grep' 'wget')
provides=('gettext')
conflicts=('gettext')
source=("git+https://git.savannah.gnu.org/git/gettext.git")
sha256sums=('SKIP')


pkgver() {
  cd "gettext"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gettext"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "gettext"

  make check
}

package() {
  cd "gettext"

  make DESTDIR="$pkgdir" install
}

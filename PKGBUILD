# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=aspell-git
pkgver=0.60.7.20110707.r19.gb2e2b25
pkgrel=1
pkgdesc="Free and Open Source spell checker"
arch=('i686' 'x86_64')
url="http://aspell.net/"
license=('LGPL')
depends=('ncurses')
makedepends=('git')
optdepends=('perl: to import old dictionaries')
provides=('aspell')
conflicts=('aspell')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/aspell.git")
sha256sums=('SKIP')


pkgver() {
  cd "aspell"

  git describe --long --tags | sed 's/^rel-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "aspell"

  PERL_USE_UNSAFE_INC=1 ./autogen
  ./configure \
    --prefix="/usr" --sysconfdir="/etc" \
    --enable-static
  make
}

package() {
  cd "aspell"

  make DESTDIR="$pkgdir" install
}

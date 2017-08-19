# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=autoconf-git
pkgver=2.69.r185.gb502e350
pkgrel=2
pkgdesc="An extensible package of M4 macros that produce shell scripts to automatically configure software source code packages"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/autoconf/autoconf.html"
license=('GPL2' 'Custom')
depends=('sh' 'perl' 'awk' 'm4' 'texinfo')
makedepends=('git')
provides=('autoconf')
conflicts=('autoconf')
source=("git+https://git.savannah.gnu.org/git/autoconf.git")
sha256sums=('SKIP')


pkgver() {
  cd "autoconf"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "autoconf"

  autoreconf -fi
  ./configure --prefix="/usr"
  make
}

check() {
  cd "autoconf"

  #make check
}

package() {
  cd "autoconf"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING.EXCEPTION" "$pkgdir/usr/share/licenses/autoconf/COPYING.EXCEPTION"

  rm "$pkgdir/usr/share/info/standards.info"
}

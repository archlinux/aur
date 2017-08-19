# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libidn-git
pkgver=1.33.r47.g13f07cbf
pkgrel=2
pkgdesc="An implementation of the Stringprep, Punycode and IDNA 2003 specifications"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libidn/"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('git' 'gengetopt' 'gperf' 'gtk-doc' 'fig2dev' 'ghostscript')
provides=('libidn')
conflicts=('libidn')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/libidn.git")
sha256sums=('SKIP')


pkgver() {
  cd "libidn"

  git describe --long --tags | sed 's/^libidn.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libidn"

  make bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libidn"

  make check
}

package() {
  cd "libidn"

  make DESTDIR="$pkgdir" install
}

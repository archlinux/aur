# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=findutils-git
pkgver=4.6.0.r235.gf2542a4f
pkgrel=1
pkgdesc="Basic directory searching utilities of the GNU operating system"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/findutils/"
license=('GPL3')
depends=('glibc' 'sh')
makedepends=('git' 'gettext')
checkdepends=('dejagnu')
provides=('findutils')
conflicts=('findutils')
source=("git+https://git.savannah.gnu.org/git/findutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "findutils"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "findutils"

  ./bootstrap

  sed -i '/^SUBDIRS/s/locate//' Makefile.in
  ./configure \
    --prefix="/usr"

  # don't build locate, but the docs want a file in there.
  make -C locate dblocation.texi
  make
}

check() {
  cd "findutils"

  #make check
}

package() {
  cd "findutils"

  make DESTDIR="$pkgdir" install
}

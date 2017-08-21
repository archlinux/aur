# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=patch-git
pkgver=2.7.5.r17.g817d7d1
pkgrel=1
pkgdesc="A utility to apply patch files to original sources"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/patch/patch.html"
license=('GPL3')
depends=('glibc' 'attr')
makedepends=('git' 'gettext')
provides=('patch')
conflicts=('patch')
source=("git+https://git.savannah.gnu.org/git/patch.git")
sha256sums=('SKIP')


pkgver() {
  cd "patch"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "patch"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "patch"

  make check
}

package() {
  cd "patch"

  make DESTDIR="$pkgdir" install
}

# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=attr-git
pkgver=2.5.2.r2.g943c776
pkgrel=1
pkgdesc="Commands for manipulating filesystem extended attributes"
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/attr"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('glibc')
makedepends=('git' 'gettext')
provides=("attr=$pkgver" 'xfsattr')
conflicts=('attr' 'xfsattr')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/attr.git")
sha256sums=('SKIP')


pkgver() {
  cd "attr"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "attr"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "attr"

  #make check
}

package() {
  cd "attr"

  make DESTDIR="$pkgdir" install
}

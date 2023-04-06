# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=attr-git
pkgver=2.5.1.r22.g2af4dd8
pkgrel=1
pkgdesc="Commands for manipulating filesystem extended attributes"
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/attr"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('git' 'gettext')
provides=("attr=$pkgver" 'xfsattr')
conflicts=('attr' 'xfsattr')
replaces=('xfsattr')
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

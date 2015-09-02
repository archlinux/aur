# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=tint2-git
_pkgname=tint2
pkgrel=1
pkgver=v0.12.1.r44.g1f7f197
pkgdesc="Git official release"
arch=('i686' 'x86_64')
url="https://gitlab.com/o9000/tint2"
license=('GPL')
depends=('gtk2' 'imlib2' 'startup-notification')
makedepends=('cmake')
install=${pkgname}.install
provides=('tint2')
conflicts=('tint2' 'tint' 'tint2-svn')
source="git+https://gitlab.com/o9000/tint2.git"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
 cd "$srcdir/$_pkgname"
 cmake . -DCMAKE_INSTALL_PREFIX=/usr 
 make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

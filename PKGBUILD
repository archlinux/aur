# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=tint2-git
_pkgname=tint2
pkgrel=2
pkgver=17.0.1.r0.gf628cba
pkgdesc="tint2 is a simple panel/taskbar made for modern X window managers. Git release."
arch=('i686' 'x86_64')
url="https://gitlab.com/o9000/tint2"
license=('GPL')
depends=('gtk2' 'gtk3' 'imlib2' 'startup-notification')
makedepends=('cmake' 'git')
install=${pkgname}.install
provides=('tint2')
conflicts=('tint2' 'tint2-svn')
source=("git+https://gitlab.com/o9000/tint2.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
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

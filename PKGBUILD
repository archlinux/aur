# Maintainer: Jakub Korbel <korbel.jak@gmail.com>

pkgname=tint2-patched-git
_pkgname=tint2
pkgrel=1
pkgver=r2168.b287074
pkgdesc="tint2 is a simple panel/taskbar made for modern X window managers. Git release with patches from https://github.com/korbeljak/tint2."
arch=('i686' 'x86_64')
url="https://github.com/korbeljak/tint2"
license=('GPL')
depends=('gtk3' 'imlib2' 'startup-notification')
makedepends=('cmake' 'git')
install=${pkgname}.install
provides=('tint2')
conflicts=('tint2' 'tint2-git')
source=("git+https://github.com/korbeljak/tint2")
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

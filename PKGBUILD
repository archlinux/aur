# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=desktop-file-utils-git
pkgver=0.23.r4.g92af410
pkgrel=1
pkgdesc="Command line utilities for working with desktop entries"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/desktop-file-utils/"
license=('GPL')
depends=('glibc' 'glib2')
makedepends=('git')
provides=('desktop-file-utils')
conflicts=('desktop-file-utils')
source=("git+https://gitlab.freedesktop.org/xdg/desktop-file-utils.git"
        "update-desktop-database.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/update-desktop-database.hook?h=packages/desktop-file-utils")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "desktop-file-utils"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "desktop-file-utils"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "desktop-file-utils"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/update-desktop-database.hook" -t "$pkgdir/usr/share/libalpm/hooks"
}

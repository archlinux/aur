# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: erm67

pkgname=micropolis-git
_pkgname=micropolis
pkgver=r93.6fa8547
pkgrel=1
pkgdesc="Micropolis Unix version (A.K.A. "S*mC*ty")"
arch=('i686' 'x86_64')
url="http://code.google.com/p/micropolis/"
license=('GPL')
depends=('sdl_mixer' 'libxpm' 'bash')
makedepends=('git')
options=(!makeflags)
source=("$_pkgname::git://git.zerfleddert.de/micropolis")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  cd $srcdir/$_pkgname
  sed -i -e 's|export SIMHOME=`pwd`|export SIMHOME="/usr/lib/micropolis"|' Micropolis
  make PREFIX="/usr" DESTDIR="$pkgdir" LIBEXECDIR="/usr/lib/micropolis" install
}

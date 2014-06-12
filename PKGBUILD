# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_pkgname=ev
pkgname=$_pkgname-git
pkgver=r45.e23387b
pkgrel=1
pkgdesc="xv image viewer replacment using EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/devs/discomfitor/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" PREFIX="/usr" install

  rm "$pkgdir/usr/share/doc/ev/COPYING"
}

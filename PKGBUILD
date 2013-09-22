# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=ev-git
_pkgname=${pkgname%-*}
pkgver=0.0.0.37.85f5fcd
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
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo "0.0.0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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

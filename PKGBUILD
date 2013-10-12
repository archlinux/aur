# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=e_jeweled-git
_pkgname=${pkgname%-*}
pkgver=0.0.0.r15.bbdb683
pkgrel=1
pkgdesc="Bejeweled style game base on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('unknown')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/devs/seoz/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local _ver=$(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]')

  echo $_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}

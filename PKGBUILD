# Maintainer: Tetsumi <tetsumi@vmail.me>
# Contributor: Boris Shomodjvarac <spam AT shomodj DOT com>

pkgname=qore
pkgver=0.8.11
pkgrel=1
epoch=
pkgdesc="Qore is a high-level, general-purpose, interpreted, dynamic programming language"
arch=("i686" "x86_64")
url="http://www.qore.org/"
license=('GPL2', "LGPL2")
groups=()
depends=("flex" "openssl" "pcre" "bzip2" "zlib")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/qore/files/$pkgname/$pkgver/${pkgname}-${pkgver}.tar.bz2")
md5sums=('483510cdcb6338ff6cb892cc29a98a63')
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed 's/LIBSUFFIX=64/LIBSUFFIX=""/g' configure -i

  _CONFIGURE_OPTS="--prefix=/usr --disable-static --disable-debug"
  [ "$CARCH" = "x86_64" ] && _CONFIGURE_OPTS="$_CONFIGURE_OPTS --enable-64bit"

  echo "./configure $_CONFIGURE_OPTS"
  ./configure $_CONFIGURE_OPTS
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}



# vim:set ts=2 sw=2 et:
 

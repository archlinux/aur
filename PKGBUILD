# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=ephoto-svn
_pkgname=ephoto
pkgver=50446
pkgrel=1
pkgdesc="A light image viewer based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary')
makedepends=('subversion')
options=('!libtool')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/$_pkgname")
md5sums=('SKIP')

pkgver() {
  svnversion "$SRCDEST/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

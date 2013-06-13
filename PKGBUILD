# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=eweather-svn
_pkgname=eweather
pkgver=84553
pkgrel=1
pkgdesc="Enlightenment module: Current weather and forcast gadget"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('libeweather-svn' 'enlightenment17')
makedepends=('subversion')
options=('!libtool')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/$_pkgname/README"

# install license files
  install -Dm644 COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
}

# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: fancris3 <fancris3 at aol.com>

pkgname=e17-places-svn
_pkgname=places
pkgver=83648
pkgrel=1
pkgdesc="Enlightenment module: Manage the mounting of volumes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/e17mods/wiki/Places"
license=('BSD')
depends=('enlightenment17' 'e_dbus')
makedepends=('subversion')
conflicts=('e-modules-extra')
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

# install license files
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

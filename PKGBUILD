# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: fancris3 <fancris3 at aol.com>

pkgname=places-git
_pkgname=${pkgname%-git}
pkgver=0.5.0.r171.92a5ec8
pkgrel=1
pkgdesc="Enlightenment module: Manage the mounting of volumes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/e17mods/wiki/Places"
license=('MIT')
depends=('enlightenment17>=0.17.99' 'udisks')
makedepends=('git')
conflicts=('e17-places-svn')
provides=('e17-places-svn')
options=('!libtool')
source=("git://git.enlightenment.org/enlightenment/modules/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  local _ver=$(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]')
  
  echo $_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

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
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


# Maintainer: Cravix < dr dot neemous at gmail dot org >
# Based on edje PKGBUILD wrote by Ronald van Haren <ronald.archlinux.org>


pkgname=terminology-git
_pkgname=${pkgname%-*}
pkgver=0.3.0.568.bf3e2ab
pkgrel=1
pkgdesc="Terminal emulator for e17, successor of previous eterm"
arch=('i686' 'x86_64')
groups=('e17-extra-svn')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('efl-git' 'elementary-git')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/apps/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local _ver=$(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]')

  printf "$_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package(){
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

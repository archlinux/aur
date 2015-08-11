# Maintainer: Simon Hollingshead <me at [firstnamelastname] dot com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=kolmafia-svn
_pkgname=kolmafia
pkgver=15495
pkgrel=1
pkgdesc="An alternate interface to the online adventure game 'Kingdom of Loathing'."
arch=('any')
url="http://kolmafia.sourceforge.net/"
license=('BSD')
depends=('java-runtime' 'bash')
makedepends=('apache-ant' 'subversion')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('kol' "$pkgname::svn+svn://svn.code.sf.net/p/kolmafia/code/")
md5sums=('6ebefe8fd7b178b73bfeb3c62256738f' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  ant daily desktop
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 "dist/KoLmafia-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -D -m755 "$srcdir/kol" "$pkgdir/usr/bin/kol"
  install -D -m644 "build/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -D -m644 "src/licenses/kolmafia-license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "util/debian/kol.xpm" "$pkgdir/usr/share/pixmaps/kol.xpm"
}

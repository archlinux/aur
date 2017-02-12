# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=abcl-svn
pkgver=r14979
pkgrel=1
pkgdesc="Full implementation of the Common Lisp language in the JVM"
arch=('any')
url="http://common-lisp.net/project/armedbear/"
license=('GPL')
depends=('java-environment' 'bash')
makedepends=('apache-ant' 'net-tools' 'subversion')
provides=('abcl' 'common-lisp')
conflicts=('abcl')
source=("svn+http://abcl.org/svn/trunk/abcl/" abcl.sh)
md5sums=('SKIP' 'd51ffd115b32f9a47f849fc7630ced4f')
_svnmod="abcl"

pkgver() {
  cd "$srcdir"/"${_svnmod}"
  local ver="$(svnversion)"
  printf r%s "${ver//[[:alpha:]]}"
}

build() {
  LANG=C
  cd "$srcdir"/"${_svnmod}"
  ant
}

package() {
  cd "$srcdir"/"${_svnmod}"
  install -Dm755 $srcdir/abcl.sh $pkgdir/usr/bin/abcl
  install -Dm644 dist/abcl.jar $pkgdir/usr/share/java/abcl.jar
  install -Dm644 dist/abcl-contrib.jar \
	  $pkgdir/usr/share/java/abcl-contrib.jar
}

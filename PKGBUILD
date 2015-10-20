# Contributor: maz-1 < omhygod19993 at gmail dot com >

pkgname=karia2-svn
pkgver=r363
pkgrel=1
pkgdesc="QT4 interface for aria2 download mananger"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/karia2"
license=('GPL')
depends=('qt4' 'aria2' 'libxtst')
makedepends=('subversion')
source="svn+https://svn.code.sf.net/p/karia2/code/trunk"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk"
  qmake-qt4
  sed -i 's;/opt/karia2/resume;/usr/bin/karia2-resume;' karia2.cpp
  make PREFIX=/usr
}

package() {
  cd "$srcdir/trunk"
  install -Dm755 bin/karia2 $pkgdir/usr/bin/karia2
  install -d $pkgdir/usr/share/karia2/images
  install -Dm644 images/wood{background,button}.png \
    $pkgdir/usr/share/karia2/images/
}

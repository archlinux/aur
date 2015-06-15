# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=oveplayer
pkgver=15
pkgrel=1
pkgdesc="OvePlayer is a player for both music notation tool Overture's document and standard midi files."
arch=('i686' 'x86_64')
url='http://oveplayer.sourceforge.net'
license=('GPL')
depends=('qt')
makedepends=('subversion' 'cmake')

_svntrunk=https://oveplayer.svn.sourceforge.net/svnroot/oveplayer/trunk
_svnmod=oveplayer

build() {
  cd "$srcdir"
  svn co "$_svntrunk" "$_svnmod"
  cd "$_svnmod"

  msg 'SVN checkout done or server timeout'
  msg 'Starting make...'

  cmake .

  make || return 1
}

package() {
  make -C "$srcdir/$_svnmod" DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/local/* "$pkgdir"/usr/
  rm -Rf "$pkgdir"/usr/local
  ln -s /usr/bin/OvePlayer "$pkgdir"/usr/bin/oveplayer
}

# vim:syntax=sh

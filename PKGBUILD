# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=libparserutils-svn
pkgver=12813
pkgrel=1
pkgdesc="A library for building efficient parsers"
arch=('any')
url="http://www.netsurf-browser.org/projects/libparserutils/"
license=('MIT')
provides=('libparserutils=0.1.0')
conflicts=('libparserutils')
makedepends=('subversion')
_svntrunk=svn://svn.netsurf-browser.org/trunk/libparserutils
_svnmod=libparserutils

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cd $_svnmod

  msg2 "Compiling..."
  make
}

package() {
  cd $_svnmod

  msg2 "Packaging..."
  make PREFIX="/usr" DESTDIR="$pkgdir/" install

  msg2 "Packaging license..."
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

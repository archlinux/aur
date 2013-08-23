# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=gaussianbeam-svn
pkgver=137
pkgrel=1
pkgdesc="Gaussian optics simulator"
arch=('i686' 'x86_64')
url="http://gaussianbeam.sourceforge.net/"
license=('GPL')
depends=('qt4>=4.4')
makedepends=('subversion')
provides=('gaussianbeam')
conflicts=('gaussianbeam')

_svntrunk=https://gaussianbeam.svn.sourceforge.net/svnroot/gaussianbeam
_svnmod=gaussianbeam

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  cmake .
  make
  install -D -m755 gaussianbeam $pkgdir/usr/bin/gaussianbeam
}

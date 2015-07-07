# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=globs-benchmarks-svn
pkgver=49
pkgrel=2
pkgdesc="Standard benchmarks set for GL O.B.S."
arch=('i686' 'x86_64')
url="http://globs.sourceforge.net"
license=('GPL')
depends=('libgl' 'sdl_image' 'globs-svn')
makedepends=('subversion' 'scons')

_svntrunk=https://globs.svn.sourceforge.net/svnroot/globs/benchmarks/trunk
_svnmod=globs-benchmarks

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Make program
  scons install root=$pkgdir prefix=/usr
}

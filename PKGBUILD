# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>

pkgname=cammill-git
pkgver=0.9.test.17.r62.gf6fe006
pkgrel=1
pkgdesc="CAM application to produce tool paths and gcode from DXF files"
arch=('i686' 'x86_64')
url="https://github.com/cammill/cammill"
license=('GPL3')
depends=('freeglut'
         'glib2'
         'gtkglext'
         'gtksourceview2'
         'gtk2' 
         'lua51')
makedepends=('clang' 'git')
checkdepends=('cppcheck')
provides=('cammill')
source=("git+https://github.com/cammill/cammill.git")
md5sums=('SKIP')

_gitroot=https://github.com/cammill/cammill.git
_gitname=cammill

pkgver()
{
  cd $_gitname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd $srcdir/$_gitname
  make clean all
}

check()
{
  cd $srcdir/$_gitname
  make check
}

package()
{
  cd $srcdir/$_gitname
  make INSTALL_PATH="$pkgdir/usr" install
}

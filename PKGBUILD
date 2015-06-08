# Contributor: royrocks <royrocks13@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tuxpaint-stamps-cvs
pkgver=20101127
pkgrel=2
arch=('any')
pkgdesc="Additional stamps for Tux Paint, cvs version"
url="http://www.newbreedsoftware.com/tuxpaint/"
license=('GPL')
depends=('tuxpaint')
provides=('tuxpaint-stamps')
conflicts=('tuxpaint-stamps')
makedepends=('cvs')
_cvsroot=":pserver:anonymous@tuxpaint.cvs.sourceforge.net:/cvsroot/tuxpaint"
_cvsmod="tuxpaint-stamps"

prepare() {
  cd $srcdir
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d$_cvsroot co -P $_cvsmod
    cd $_cvsmod
  fi
          
  msg "CVS checkout done or server timeout"
  msg "Starting make..."
  make PREFIX=/usr
}

package() {
  cd $srcdir/$_cvsmod
  make DATA_PREFIX=$pkgdir/usr/share/tuxpaint/ install-all
} 

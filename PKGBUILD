# Maintainer: Emile Pesik <emile [at] aerion [dot] co [dot] uk> 
# Contributor: David Ferreira - FZ <davidferreira.fz at gmail.com>
pkgname=kdeplasma-applets-keyleds-svn
pkgver=91
pkgrel=1
pkgdesc="A plasmoid to display LED status in the KDE panel, for wireless keyboards without LEDs"
arch=('i686' 'x86_64')
url="http://software.dukitan.com/en/keyleds/"
license=('GPL')
depends=('kdebase-workspace' 'xorg-xset')
makedepends=('cmake' 'subversion')
provides=('kdeplasma-applets-keyleds')
conflicts=('kdeplasma-applets-keyleds')

_svntrunk=('http://dukitan.googlecode.com/svn/trunk/KeyLEDs')
_svnmod="KeyLEDs"

build() {
  svn co "$_svntrunk" --config-dir ./ "$_svnmod"

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  
  cd "$srcdir/$_svnmod-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  
  make
  }
	
package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="${pkgdir}" install
  }

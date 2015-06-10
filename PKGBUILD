# Maintainer: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
pkgname=freetuxtv-svn
pkgver=746
pkgrel=1
pkgdesc="WebTV player to watch ADSL TV on the PC"
arch=('i686' 'x86_64')
url="http://code.google.com/p/freetuxtv/"
license=('GPL3')
install=freetuxtv-svn.install
depends=('vlc' 'gtk3' 'sqlite' 'curl' 'libnotify')
makedepends=('subversion' 'intltool')
conflicts=('freetuxtv')

source=('freetuxtv::svn+http://freetuxtv.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/freetuxtv
  echo $(LANG=C svn info -r HEAD|grep Revision|cut -d' ' -f2)
}

build() {
  cd $srcdir/freetuxtv

  NOCONFIGURE=true ./autogen.sh
  ./configure --prefix=/usr --with-gtk=3.0
  make
}

package() {
  cd $srcdir/freetuxtv
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:

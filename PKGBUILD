# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=audiotools
pkgver=2.22
pkgrel=1
pkgdesc="A collection of Python-based command-line audio handling programs"
arch=('i686' 'x86_64')
url="http://audiotools.sourceforge.net"
license=('GPL')
depends=('python2-urwid' 'libcdio-paranoia' 'lame' 'twolame' 'vorbis-tools' 
'faad2' 'faac' 'pygtk' 'opus-tools' 'opusfile' 'libpulse')
optdepends=('cdrkit: CD burning without cuesheet support'
            'cdrdao: CD burning with cuesheeet support')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8e373a6c8caf4d55bcd501c5ab6ea555')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed 's/#include <cdio\/cdda.h>/#include <cdio\/paranoia\/cdda.h>/' -i src/cdiomodule.h
  sed 's/#include <cdio\/paranoia.h>/#include <cdio\/paranoia\/paranoia.h>/' -i src/cdiomodule.h
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
  cd docs
  install -d $pkgdir/usr/share/man/man1
  install -d $pkgdir/usr/share/man/man5
  make install -e MAN_PATH=$pkgdir/usr/share/man -e PYTHON=/usr/bin/python2
}

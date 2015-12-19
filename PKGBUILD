# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=audiotools
pkgver=3.1.1
pkgrel=1
pkgdesc="A collection of Python-based command-line audio handling programs"
arch=('i686' 'x86_64')
url="http://audiotools.sourceforge.net"
license=('GPL')
depends=('python-urwid' 'libcdio-paranoia' 'lame' 'twolame' 'vorbis-tools' 
'faad2' 'faac' 'opus-tools' 'opusfile' 'libpulse' 'wavpack')
makedepends=('python-setuptools')
optdepends=('cdrkit: CD burning without cuesheet support'
            'cdrdao: CD burning with cuesheeet support'
            'pygtk: coverview')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('08c52afbdfd41f18d068c525bcf93e42')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed 's/#include <cdio\/cdda.h>/#include <cdio\/paranoia\/cdda.h>/' -i src/cdiomodule.h
  sed 's/#include <cdio\/paranoia.h>/#include <cdio\/paranoia\/paranoia.h>/' -i src/cdiomodule.h
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir 
  cd docs
  install -d $pkgdir/usr/share/man/man1
  install -d $pkgdir/usr/share/man/man5
  make install -e MAN_PATH=$pkgdir/usr/share/man
}

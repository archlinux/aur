# $Id$
# Maintainer: Markus Koch <CClassicVideos@aol.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Jared Casper <jaredcasper@gmail.com>

pkgname=gtkwave-svn
pkgver=1553
pkgrel=1
pkgdesc='A wave viewer which reads LXT, LXT2, VZT, GHW and VCD/EVCD files (experimental version from svn)'
arch=('i686' 'x86_64')
url='http://gtkwave.sourceforge.net'
license=('GPL' 'MIT')
depends=('bzip2' 'xz' 'gtk2' 'desktop-file-utils')
makedepends=('gperf' 'subversion')
conflicts=('gtkwave')
install='gtkwave.install'
source=("$srcdir/gtkwave::svn://svn.code.sf.net/p/gtkwave/code/")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/gtkwave"
  svnversion
}

build() {
  cd "$srcdir/gtkwave/gtkwave3"

  ./configure \
    --prefix=/usr \
    --disable-tcl \
    --disable-mime-update \
    --with-gsettings

  make CFLAGS="-D_LARGEFILE64_SOURCE -O"
}

package() {
  cd "$srcdir/gtkwave/gtkwave3"

  make DESTDIR="${pkgdir}" install

  install -D -m644 "$srcdir/gtkwave/gtkwave3/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/gtkwave/LICENSE.TXT"
}


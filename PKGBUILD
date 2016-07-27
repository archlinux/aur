# Maintainer: NextHendrix <cjones12@sheffield.ac.uk>

pkgname=vmg-svn
pkgver=3.7
pkgrel=3
pkgdesc="Handy virtual magnifying glass tool SVN version"
arch=('x86_64' 'i686')
url=""
license=('GPL2')
depends=('gdk-pixbuf2')
source=('svn+http://svn.code.sf.net/p/magnifier/code/trunk'
	'vmg.desktop')
makedepends=('subversion' 'lazarus' 'fpc')
provides=('vmg')
conflicts=('vmg')
md5sums=('SKIP'
         'e831d6b702672283d3c64202454c6f32')

build() {
  cd "$srcdir/trunk"
ARCH=$(uname -m)

case "$ARCH" in

 "i686") ARCH="i386";;

 "i586") ARCH="i386";;

 "i486") ARCH="i386";;

esac

echo "Target architecture: $ARCH"

OS="linux"

echo "Target operating system: $OS"


fpc -S2cgi -O1 -gl -vewnhi -l -Fu/usr/lib/lazarus/lcl/units/$ARCH-$OS/ -Fu/usr/lib/lazarus/components/lazutils/lib/$ARCH-$OS/ -Fu/usr/lib/lazarus/lcl/units/$ARCH-$OS/ -Fu/usr/lib/lazarus/lcl/units/$ARCH-$OS/gtk2/ -Fu/usr/lib/lazarus/packager/units/$ARCH-$OS/ -Fu. -o./magnifier -dLCL -dLCLgtk2 magnifier.dpr
}

package() {
cd "$srcdir"
mkdir -p $pkgdir/usr/share/applications
cp ./vmg.desktop $pkgdir/usr/share/applications
cd "$srcdir/trunk"
DESTDIR="$pkgdir"

mkdir -p $DESTDIR/usr/share/magnifier

cp ./topleft.bmp $DESTDIR/usr/share/magnifier/
cp ./topright.bmp $DESTDIR/usr/share/magnifier/
cp ./bottomleft.bmp $DESTDIR/usr/share/magnifier/
cp ./bottomright.bmp $DESTDIR/usr/share/magnifier/
cp ./top.bmp $DESTDIR/usr/share/magnifier/
cp ./left.bmp $DESTDIR/usr/share/magnifier/
cp ./bottom.bmp $DESTDIR/usr/share/magnifier/
cp ./right.bmp $DESTDIR/usr/share/magnifier/
cp ./icon3.ico $DESTDIR/usr/share/magnifier/
cp ./icon3.png $DESTDIR/usr/share/magnifier/
cp ./cecae.bmp $DESTDIR/usr/share/magnifier/
cp ./feusp.bmp $DESTDIR/usr/share/magnifier/
cp ./vmg.bmp $DESTDIR/usr/share/magnifier/
cp ./lupa.bmp $DESTDIR/usr/share/magnifier/
cp ./usplegal.bmp $DESTDIR/usr/share/magnifier/

cp ./docs/README-EN.pdf $DESTDIR/usr/share/magnifier/
cp ./docs/README-EN.rtf $DESTDIR/usr/share/magnifier/
cp ./docs/README-PT.pdf $DESTDIR/usr/share/magnifier/
cp ./docs/README-PT.rtf $DESTDIR/usr/share/magnifier/

mkdir -p $DESTDIR/usr/bin
cp ./magnifier $DESTDIR/usr/bin/vmg

}


# Maintainer: DavidK <david_king at softhome dot net>
# Contributor: Olivier Bordes <package@obordes.com>
pkgname=crrcsim
pkgver=0.9.12
pkgrel=3
pkgdesc="Model airplane flight simulation program."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/crrcsim/"
license=('GPL')
depends=('sdl>=1.2.5' 'portaudio' 'libjpeg' 'cgal')
makedepends=('gawk' 'plib>=1.8.4')
source=($pkgname.desktop $pkgname.png http://sourceforge.net/projects/crrcsim/files/latest/download/$pkgname-$pkgver.tar.gz)
md5sums=('130b2a0661e96dce8b27dc3531c87474'
         '1cba5f3c8d3439e56866880429694a5c'
         'd6144138c82bff36d55b4517a9bf1a7b')

build() {
  cd $pkgname-$pkgver
  sed -i "s/-lCGAL/\"-lCGAL -lgmp\"/g" ./configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -m755 $pkgname.desktop $pkgdir/usr/share/applications
  install -m755 $pkgname.png $pkgdir/usr/share/pixmaps
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:



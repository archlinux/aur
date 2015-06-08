# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=amide  
pkgver=1.0.5
pkgrel=3
pkgdesc="Medical Imaging Data Examiner"
url="http://amide.sourceforge.net/packages.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dcmtk>=3.6.0' 'xmedcon' 'libgnomecanvas' 'ffmpeg' 'gsl' 'gnome-vfs')
optdepends=('volpack: for volume rendering')
makedepends=('gnome-doc-utils')
source=(http://downloads.sourceforge.net/project/$pkgname/amide/$pkgver/$pkgname-$pkgver.tgz)
md5sums=('8a9b89e3d3ec1bb3e390f202f4861a7c')
options=('!makeflags')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-ffmpeg --with-xmedcon-exec-prefix=/usr/bin
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  sed -i 's+.png++' $pkgdir/usr/share/applications/amide.desktop
}

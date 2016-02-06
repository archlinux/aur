# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.2
pkgrel=1
pkgdesc="3D video player with multi-display support."
arch=('i686' 'x86_64')
url="http://bino3d.org/"
license=('GPL3')
depends=('ffmpeg' 'freealut' 'freeglut' 'glew' 'libass' 'qt5-base')
optdepends=('lirc: for infrared remote control')
source=(http://download.savannah.gnu.org/releases-noredirect/$pkgname/$pkgname-$pkgver.tar.xz 'gui_common.h')
md5sums=('b6cbb49c82da6a1d7734e5c2b66864c3'
         'c152d0a10fcf712760919a5892f87a6d')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/CXXFLAGS -fPIE/& -fPIC/' configure
  ./configure --prefix=/usr \
              --with-qt-version=5 \
  #            --with-xnvctrl # Enable NVIDIA Quadro SDI output
}

build() {
  cp $srcdir/gui_common.h $srcdir/$pkgname-$pkgver/src
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

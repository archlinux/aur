# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.1
pkgrel=3
pkgdesc="3D video player with multi-display support."
arch=('i686' 'x86_64')
url="http://bino3d.org/"
license=('GPL3')
depends=('ffmpeg' 'freealut' 'freeglut' 'glew' 'libass' 'qt5-base')
optdepends=('lirc: for infrared remote control')
source=(http://download.savannah.gnu.org/releases-noredirect/$pkgname/$pkgname-$pkgver.tar.xz)
md5sums=('59471d7eb3b6981a1e610f96a12ff47c')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/CXXFLAGS -fPIE/& -fPIC/' configure
  ./configure --prefix=/usr \
              --with-qt-version=5 \
  #            --with-xnvctrl # Enable NVIDIA Quadro SDI output
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

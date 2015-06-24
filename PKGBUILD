# Maintainer: zoe <chp321@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=kmidimon
pkgver=0.7.5
pkgrel=5
pkgdesc="A MIDI monitor for Linux using ALSA sequencer"
arch=('i686' 'x86_64')
url="http://kmidimon.sourceforge.net/"
license=('GPL')
depends=('kdelibs' 'drumstick')
makedepends=('cmake' 'automoc4')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('581d29ff9a0aabf4aeb6beeb40f589b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # doc build errors prevent success
  sed -i '/doc/d' CMakeLists.txt
  
  # Compile code with -fPIC (build code with Position Independent Code)
  sed -i '49iADD_DEFINITIONS(-fPIC)' CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release
          
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
 
# vim:set ts=2 sw=2 et:
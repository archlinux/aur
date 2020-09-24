# Maintainer: zoe <aur at fully dot automated dot ee ignore everything else after the first ee>
pkgname=ktechlab
pkgver=0.50.0
pkgrel=1
pkgdesc="IDE for microcontrollers and electronic simulation."
arch=('x86_64' 'i686')
url="https://cgit.kde.org/ktechlab.git"
license=('GPL')
depends=('kdelibs' 'gpsim' 'khtml' 'ktexteditor' 'kdebase-runtime' 'qt5-base')
makedepends=('git' 'cmake' 'gendesk' 'automoc4') 
optdepends=('gpsim: for simulating PIC microcontrollers')
source=(https://download.kde.org/unstable/ktechlab/ktechlab-$pkgver.tar.xz)
md5sums=('5efe09b276fad08d74ead245a597797d')
sha256sums=('cf0fe078f8afad7f3237a4e052dd2cace185d390a02f15ebe60cccabcbe8fdfe')

build() {
  cd ktechlab-$pkgver
  if [ ! -d build ]; then
    mkdir build
  fi
  cd build
  cmake .. 
  make
}

package() {
  cd $srcdir/ktechlab-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/usr/share/pixmaps
  install -m664 $srcdir/ktechlab-$pkgver/icons/128-apps-ktechlab.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
} 

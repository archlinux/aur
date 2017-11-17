# Maintainer: dmidge <quelque_ri1 at caramail point fr>
pkgname=ktechlab-git
pkgver=0.3.7.rv0.40.0.r8.g34b41aa3
pkgrel=3
pkgdesc="KTechLab is an IDE for microcontrollers and electronics. It supports circuit simulation, program development for microcontrollers and simulating the programmed microcontroller together with its application circuit."
arch=('x86_64' 'i686')
url="https://github.com/ktechlab/ktechlab"
license=('GPL')
#options=(!makeflags)
depends=('qt4' 'kdelibs')
makedepends=('git' 'cmake' 'gcc' 'gendesk' 'automoc4')
source=(git+https://github.com/ktechlab/ktechlab
        "$pkgname.desktop")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd ktechlab
  echo "0.3.7.r`git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'`"
}

#prepare() {
#  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
#}

build() {
  cd ktechlab
  if [ ! -d build ]; then
    mkdir build
  fi
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=debugfull
  make
}

package() {
  cd $srcdir/ktechlab/build
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/usr/share/pixmaps
  install -m664 $srcdir/ktechlab/icons/hi128-app-ktechlab.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
} 

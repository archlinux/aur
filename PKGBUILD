#Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-tsundere
pkgver=0.1
pkgrel=1
pkgdesc="Tsundere module for fcitx, adds something following every character you input."
arch=('i686' 'x86_64')
url="https://github.com/felixonmars/fcitx-tsundere"
license=('GPL')
depends=('fcitx>=4.2.0')
conflicts=fcitx-tsundere-git
makedepends=('cmake' 'intltool')
source=($pkgname.tar.gz::https://github.com/felixonmars/fcitx-tsundere/tarball/$pkgver)
md5sums=('e490c2833d4f2ed38d3155b842bb0ff4')

build() {
  cd "$srcdir/"
  msg "Starting make..."

  rm -rf $pkgname
  mv felixonmars-$pkgname-* $pkgname
  cd $pkgname

  rm -rf build
  mkdir build
  cd build
    
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="${pkgdir}" install
}


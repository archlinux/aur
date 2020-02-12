# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip
pkgver=1.6.0
pkgrel=1
pkgdesc='Screenshot tool inspired by Windows Snipping Tool and made with Qt for Linux'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/ksnip'
license=('GPL')
depends=(
  qt5-x11extras
  kimageannotator-git
  kcolorpicker-git
  kimageannotator-git
)
makedepends=(
  cmake
  extra-cmake-modules
  qt5-tools
  kimageannotator-git
  kcolorpicker-git
)
conflicts=(
  ksnip-git
)
source=($pkgname-$pkgver.tar.gz::https://github.com/DamirPorobic/ksnip/archive/v${pkgver}.tar.gz)
sha256sums=('914c6b2ee82fcba5eb50ac964055d72b62c12d335e33cde1fced51e3acfac8ee')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
  test -d build || mkdir build
}
build(){
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"
#   mv bin usr
}

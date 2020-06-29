# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip
pkgver=1.7.1
pkgrel=1
pkgdesc='Screenshot tool inspired by Windows Snipping Tool and made with Qt for Linux'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/ksnip'
license=('GPL')
depends=(
  qt5-x11extras
  kcolorpicker-git
  kimageannotator
)
makedepends=(
  cmake
  extra-cmake-modules
  qt5-tools
)
conflicts=(
  ksnip-git
)
source=($pkgname-$pkgver.tar.gz::https://github.com/DamirPorobic/ksnip/archive/v${pkgver}.tar.gz)
# source=($pkgname-$pkgver.tar.gz::$(curl -s https://api.github.com/repos/ksnip/ksnip/releases/latest|grep tarball_url | sed 's/^.*"\(.*\)",/\1/g'))
sha256sums=('43c18bd8110caa9a778878d56df4e5a2716b8c51a3edf65f3077413fe9f0dbac')

# pkgver(){
#   curl -s https://api.github.com/repos/ksnip/ksnip/releases/latest|grep tarball_url | sed 's/^.*"\(.*\)",/\1/g'
#   curl -s https://api.github.com/repos/ksnip/ksnip/releases/latest| awk '/tag_name/ {print $2}' | sed 's/"v\|",//g'
# }
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
}

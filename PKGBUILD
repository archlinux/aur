# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=eq10q
pkgver=2.0
pkgrel=1
pkgdesc="An LV2 parametric equalizer audio plugin"
arch=('i686' 'x86_64')
url="http://eq10q.sourceforge.net/"
license=('GPL3')
groups=('lv2-plugins')
depends=('fftw' 'gtkmm' 'lv2')
makedepends=('cmake')
source=("http://download.sourceforge.net/project/eq10q/$pkgname-${pkgver}.tar.gz")
md5sums=('adb14399be61348146e8fee5595e725d')

prepare() {
  cd "$pkgname-${pkgver}"
  [ -d build ] || mkdir build

  # strip local path
  sed -i "s|/local||" CMakeLists.txt
}

build() {
  cd "$pkgname-${pkgver}/build"

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr/lib/lv2 -DCMAKE_CXX_STANDARD=11
  make
}

package() {
  cd "$pkgname-${pkgver}/build"

  make DESTDIR="$pkgdir" install
}

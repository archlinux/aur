# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=eq10q
pkgver=2_beta7.1
pkgrel=1
pkgdesc="An LV2 parametric equalizer audio plugin"
arch=('i686' 'x86_64')
url="http://eq10q.sourceforge.net/"
license=('GPL3')
groups=('lv2-plugins')
depends=('fftw' 'gtkmm' 'lv2')
makedepends=('cmake')
source=("http://download.sourceforge.net/project/eq10q/$pkgname-${pkgver//_/-}.tar.gz")
md5sums=('a40e5c09d1a8bc4e1e60f91508593436')

prepare() {
  cd $pkgname-${pkgver//_/-}
  [ -d build ] || mkdir build

  # strip local path
  sed -i "s|/local||" CMakeLists.txt
}

build() {
  cd $pkgname-${pkgver//_/-}/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr/lib/lv2
  make
}

package() {
  cd $pkgname-${pkgver//_/-}/build

  make DESTDIR="$pkgdir" install
}

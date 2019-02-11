# Maintainer: DJ Griffin <thewisenoob@gmail.com>

pkgname=omp
pkgver=0.1.1
pkgrel=5
pkgdesc='Open-Source Music Player'
url='https://openmusicplayer.com/'
arch=(x86_64)
license=(GPL3)
depends=(gstreamer gst-libav gst-plugins-bad gst-plugins-base 
         gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gtkmm3
         libclastfm libconfig sqlite taglib)
makedepends=(git)
provides=('omp')
conflicts=('omp' 'omp-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheWiseNoob/OMP/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "OMP-$pkgver"

  CXXFLAGS='-g -DFLATPAK=$(FLATPAK) -std=c++17 -Wall -pipe'
  CXXFLAGS+=' -Wno-deprecated-declarations'
  CXXFLAGS+=' -Wno-parentheses -fconcepts -Wno-catch-value -Wno-return-type'

  make CXXFLAGS=$(CXXFLAGS) -e FLATPAK=0 

}

package() {
  cd "OMP-$pkgver"
  make install DESTDIR=${pkgdir}
}

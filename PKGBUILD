# Maintainer: DJ Griffin <thewisenoob@gmail.com>

pkgname=omp-git
pkgver=0.1.1
pkgrel=10
pkgdesc='Open-Source Music Player'
url='https://openmusicplayer.com/'
arch=(x86_64)
license=(GPL3)
depends=(gstreamer gst-libav gst-plugins-bad gst-plugins-base 
         gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gtkmm3
         libclastfm libconfig sqlite taglib)
makedepends=(git)
provides=('omp-git')
conflicts=('omp' 'omp-git')
source=("$pkgname::git+https://github.com/TheWiseNoob/OpenMusicPlayer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  make -e FLATPAK=0 CXXFLAGS='-g -DFLATPAK=$(FLATPAK) -std=c++17 -Wall -pipe -Wno-deprecated-declarations -Wno-parentheses -fconcepts -Wno-catch-value -Wno-return-type'

}

package() {
  cd "${pkgname}"
  make install DESTDIR=${pkgdir}
}

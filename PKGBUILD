# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-movie-git
pkgver=5.9.8.r48.g225c49e9
pkgrel=1
pkgdesc='Movie player based on mpv'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/deepin-movie-reborn"
license=('GPL3')
depends=('deepin-qt5integration-git'  'ffmpegthumbnailer' 'libxtst' 'mpv' 'qtdbusextended' 'qtmpris')
makedepends=('cmake' 'gtest' 'ninja' 'qt5-tools')
provides=('deepin-movie')
conflicts=('deepin-movie')
groups=('deepin-extra-git')
options=('!lto')
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-movie-reborn/")
sha512sums=('SKIP')

prepare() {
    cd $deepin_source_name
}

build() {
  cd $pkgname
  export CXXFLAGS+=' -fpermissive'
  cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install
}

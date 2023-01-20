# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=qdvdauthor
pkgver=2.3.1
pkgrel=13
pkgdesc='QDVDAuthor is a GUI frontend for dvdauthor, video DVD creator'
url='https://sourceforge.net/projects/qdvd'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt5-base' 'ffmpeg063-static' 'vlc' 'xine-lib' 'libx11')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=()
provides=(
  'dvd-slideshow'
  'qdvdauthor'
  'qplayer'
  'qslideshow'
  'qrender'
)
options=()
source=("https://sourceforge.net/projects/qdvd/files/qdvd-2.3.1-qt5/qdvdauthor-${pkgver}-013.tar.gz"
        'CMakeLists.patch'
        'CMakeLists_qrender.patch')
md5sums=('c678e035b7547f02ed9eca9c78b38769'
         'c9c7641aff17d1f9a299f4ea4fa03c6b'
         '612adb519f1dc94a403740e9c08a9afe')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/CMakeLists.patch"
  patch --forward --strip=1 --input="${srcdir}/CMakeLists_qrender.patch"
}

build() {
  cd qdvdauthor-${pkgver}/build
  
  cmake ../. -DCMAKE_INSTALL_PREFIX=/usr 
  make clean 
  make "-j$(nproc)" || return 1
}
 
package() {
  cd qdvdauthor-${pkgver}/build
  
  make DESTDIR="$pkgdir" install
}

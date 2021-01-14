# Maintainer: Roland Suchan <snrd at arcor dot de>
# Contributor: Emanuele Rossi <newdna1510 at yahoo dot it>

pkgname=qdvdauthor
pkgver=2.3.1
pkgrel=12
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
source=("https://sourceforge.net/projects/qdvd/files/archlinux/qdvdauthor-${pkgver}-012a.tar.gz")
md5sums=('24efd1aa4d5455806c4ec1289855b08f')

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

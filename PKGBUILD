# Maintainer: Roland Suchan <snrd at arcor dot de>
# Contributor: Emanuele Rossi <newdna1510 at yahoo dot it>

pkgname=qdvdauthor
pkgver=2.3.1
pkgrel=11
pkgdesc='QDVDAuthor is a GUI frontend for dvdauthor, video DVD creator'
url='https://sourceforge.net/projects/qdvd'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt5-base' 'ffmpeg063-static' 'vlc' 'xine-lib')
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
source=("https://sourceforge.net/projects/qdvd/files/qdvd-2.3.1-qt5/qdvdauthor-${pkgver}-011a.tar.gz")
md5sums=('426a2f3e39c042188308bac9bfaff1e1')

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

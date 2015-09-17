# Maintainer: Florian Bigard <florian.bigard@gmail.com>
# Thanks to Adria Arrufat <swiftscythe@gmail.com>

pkgname=clementine-qt5-git
pkgver=1.2.3.r1376.gc5ff9ed
pkgrel=1
pkgdesc="Experimental Qt5 version of Clementine, a modern music player and library organiser."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
         'gst-libav' 'taglib' 'glew' 'liblastfm-qt5' 'libgpod' 'desktop-file-utils'
         'libmtp' 'libplist' 'hicolor-icon-theme' 'qt5-base' 'sparsehash'
         'libechonest-qt5' 'libcdio' 'protobuf' 'crypto++' 'chromaprint'
         'libmygpo-qt5-git' 'qt5-tools' 'qt5-x11extras')
makedepends=('git' 'boost' 'cmake' 'mesa')
install=clementine.install
# Uncomment next lines to enable more features
#makedepends+=('libspotify' 'libgpod' 'libimobiledevice')
#optdepends+=(
#'libspotify: for Spotify support'
#'libimobiledevice: for iPhone and iPod Touch support'
#)

url="http://www.clementine-player.org/"
source=('git+https://github.com/clementine-player/Clementine.git#branch=qt5')
sha256sums=('SKIP')

provides=('clementine')
conflicts=('clementine')
replaces=('clementine')


pkgver() {
  cd Clementine
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build

  # Don't make a release build since it's experimental and we would need debug/info/warning messages
  # Add -DCMAKE_BUILD_TYPE=Release if you're an adventurer
  cmake "../Clementine" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make 
}

package(){
  cd build
  make DESTDIR=${pkgdir} install
}

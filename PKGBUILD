# Maintainer: Florian Bigard <florian.bigard@gmail.com>
# Thanks to Adria Arrufat <swiftscythe@gmail.com>

pkgname=clementine-qt5-git
pkgver=1.2.3.r1211.g00f8e5b
pkgrel=1
pkgdesc="Experimental Qt5 version of Clementine, a modern music player and library organiser."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gst-plugins-base' 'gst-libav' 'taglib' 'glew' 'liblastfm-qt5-git'
         'libgpod' 'desktop-file-utils' 'libmtp' 'libplist' 'hicolor-icon-theme'
         'qt5-base' 'sparsehash' 'libechonest-qt5-git' 'libcdio' 'protobuf'
         'crypto++' 'chromaprint' 'libmygpo-qt5-git')
optdepends=('gst-plugins-good: for use with "Good" plugin libraries'
            'gst-plugins-bad: for use with "Bad" plugin libraries'
            'gst-plugins-ugly: for use with "Ugly" plugin libraries'
)
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

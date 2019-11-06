# Maintainer: basketdou <basketdou@gmail.com>

pkgname=kmplayer-git-master
pkgver=0.12.0.b
_pkgver=0.12.0b
pkgrel=5
pkgdesc="Video player plugin for Konqueror and basic MPlayer/Xine/ffmpeg/ffserver/VDR frontend for KDE. master branch."
arch=(x86_64)
license=(GPL LGPL FDL)
url="https://kmplayer.kde.org"
depends=(kmediaplayer kdelibs4support phonon-qt5 hicolor-icon-theme)
makedepends=(extra-cmake-modules kdesignerplugin kdoctools kinit)
optdepends=('mplayer: mplayer backend')
provides=('kmplayer')
conflicts=('kmplayer')
source=("git://anongit.kde.org/kmplayer.git#branch=master")
sha256sums=("SKIP")
foldername="kmplayer"
prepare() {
  mkdir -p build
  cd $foldername
}

build() {
  cd build
  cmake ../$foldername \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

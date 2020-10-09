# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mediainfo-gui-git
pkgver=20.08.r25.g687f4b59
pkgrel=1
pkgdesc="GUI utility for displaying technical and tag data for media files"
arch=('i686' 'x86_64')
url="https://mediaarea.net/en/MediaInfo"
license=('BSD')
depends=('glibc' 'hicolor-icon-theme' 'libmediainfo' 'qt5-base')
makedepends=('git')
provides=('mediainfo-gui')
conflicts=('mediainfo-gui')
source=("git+https://github.com/MediaArea/MediaInfo.git")
sha256sums=('SKIP')


pkgver() {
  cd "MediaInfo"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "MediaInfo/Project/QMake/GUI"

  qmake "MediaInfoQt.pro"
  make
}

package() {
  cd "MediaInfo"

  make -C "Project/QMake/GUI" INSTALL_ROOT="$pkgdir" install

  install -Dm644 "Source/Resource/Image/MediaInfo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/mediainfo.png"
  install -Dm644 "Source/Resource/Image/MediaInfo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/mediainfo.svg"
  install -Dm644 "Source/Resource/Image/MediaInfo.xpm" \
    "$pkgdir/usr/share/pixmaps/mediainfo.xpm"
  install -Dm644 "Project/GNU/GUI/mediainfo-gui.desktop" \
    -t "$pkgdir/usr/share/applications"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/mediainfo-gui"
}

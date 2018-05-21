# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mediainfo-gui-git
pkgver=18.05.r14.g78c2ab41
pkgrel=2
pkgdesc="GUI utility for displaying technical and tag data for media files"
arch=('i686' 'x86_64')
url="https://mediaarea.net/en/MediaInfo"
license=('BSD')
depends=('glibc' 'libmediainfo' 'qt5-base')
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

  pushd "Project/QMake/GUI"
  make INSTALL_ROOT="$pkgdir" install

  popd
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

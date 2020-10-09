# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mediainfo-git
pkgver=20.08.r25.g687f4b59
pkgrel=1
pkgdesc="Utility for displaying technical and tag data for media files"
arch=('i686' 'x86_64')
url="https://mediaarea.net/en/MediaInfo"
license=('BSD')
depends=('glibc' 'libmediainfo')
makedepends=('git')
provides=('mediainfo')
conflicts=('mediainfo')
source=("git+https://github.com/MediaArea/MediaInfo.git")
sha256sums=('SKIP')


pkgver() {
  cd "MediaInfo"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "MediaInfo/Project/GNU/CLI"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "MediaInfo"

  make -C "Project/GNU/CLI" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/mediainfo"
}

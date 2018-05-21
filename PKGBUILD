# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mediainfo-git
pkgver=18.05.r14.g78c2ab41
pkgrel=2
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
  ./configure --prefix="/usr"
  make
}

check() {
  cd "MediaInfo/Project/GNU/CLI"

  make check
}

package() {
  cd "MediaInfo"

  pushd "Project/GNU/CLI"
  make DESTDIR="$pkgdir" install

  popd
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmediainfo-git
pkgver=20.08.r64.g3aed02af
pkgrel=1
pkgdesc="Shared library for mediainfo"
arch=('i686' 'x86_64')
url="https://mediaarea.net/en/MediaInfo"
license=('BSD')
depends=('glibc' 'curl' 'glib2' 'libmms' 'libzen' 'zlib')
makedepends=('git')
provides=('libmediainfo')
conflicts=('libmediainfo')
source=("git+https://github.com/MediaArea/MediaInfoLib.git")
sha256sums=('SKIP')


pkgver() {
  cd "MediaInfoLib"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "MediaInfoLib/Project/GNU/Library"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-libcurl \
    --with-libmms
  make
}

check() {
  cd "MediaInfoLib/Project/GNU/Library"

  #make check
}

package() {
  cd "MediaInfoLib"

  make -C "Project/GNU/Library" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libmediainfo"
}

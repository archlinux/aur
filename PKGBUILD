# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsndfile-git
pkgver=1.0.28.r74.gbeee21e5
pkgrel=2
pkgdesc="C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile/"
license=('LGPL')
depends=('glibc' 'alsa-lib' 'flac' 'libogg' 'libvorbis')
makedepends=('git' 'autogen')
provides=('libsndfile')
conflicts=('libsndfile')
options=('staticlibs')
source=("git+https://github.com/erikd/libsndfile.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsndfile"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libsndfile"

  ./autogen.sh
  ./configure --prefix="/usr" --disable-sqlite
  make
}

check() {
  cd "libsndfile"

  make check
}

package() {
  cd "libsndfile"

  make DESTDIR="$pkgdir" install
}

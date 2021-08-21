# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsndfile-git
pkgver=1.1.0beta1.r11.g110e26d9
pkgrel=1
pkgdesc="C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="https://libsndfile.github.io/libsndfile/"
license=('LGPL')
depends=('glibc' 'alsa-lib' 'flac' 'sqlite' 'libogg' 'libvorbis')
makedepends=('git' 'autogen')
optdepends=('alsa-lib: for sndfile-play')
provides=('libsndfile' 'libsndfile.so')
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
  ./configure \
    --prefix="/usr"
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

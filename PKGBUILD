# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=audiofile-git
pkgver=0.3.6.r25.gb62c902
pkgrel=1
pkgdesc="Library for reading and writing audio files in many common formats"
arch=('i686' 'x86_64')
url="https://audiofile.68k.org/"
license=('LGPL')
depends=('glibc' 'alsa-lib' 'flac')
makedepends=('git')
provides=('audiofile')
conflicts=('audiofile')
options=('staticlibs')
source=("git+https://github.com/mpruett/audiofile.git")
sha256sums=('SKIP')


pkgver() {
  cd "audiofile"

  git describe --long --tags | sed 's/^audiofile-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "audiofile"

  ./autogen.sh
  ./configure --prefix="/usr" --disable-docs
  make
}

check() {
  cd "audiofile"

  make check
}

package() {
  cd "audiofile"

  make DESTDIR="$pkgdir" install
}

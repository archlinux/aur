# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsamplerate-git
pkgver=83a9482
pkgrel=2
epoch=1
pkgdesc="A Sample Rate Converter for audio"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/SRC/index.html"
license=('BSD')
depends=('glibc' 'libsndfile')
makedepends=('git')
checkdepends=('fftw')
provides=('libsamplerate')
conflicts=('libsamplerate')
options=('staticlibs')
source=("git+https://github.com/erikd/libsamplerate.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsamplerate"

  git describe --always
}

build() {
  cd "libsamplerate"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libsamplerate"

  make check
}

package() {
  cd "libsamplerate"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libsamplerate/COPYING"
}

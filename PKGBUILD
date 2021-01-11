# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsamplerate-minimal-git
pkgver=r437.g0668431
pkgrel=1
pkgdesc="A Sample Rate Converter for audio"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/SRC/index.html"
license=('BSD')
depends=('glibc' 'libsndfile')
makedepends=('git')
#checkdepends=('fftw')
provides=('libsamplerate')
conflicts=('libsamplerate')
options=('staticlibs')
source=("git+https://github.com/erikd/libsamplerate.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsamplerate"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libsamplerate"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

#check() {
#  cd "libsamplerate"

#  make check
#}

package() {
  cd "libsamplerate"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libsamplerate/COPYING"
}

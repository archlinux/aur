# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libopusenc-git
pkgver=0.2.1.r2.g9cb17c6
pkgrel=1
pkgdesc="High-level API for encoding .opus files"
arch=('i686' 'x86_64')
url="https://opus-codec.org/"
license=('BSD')
depends=('glibc' 'opus')
makedepends=('git')
provides=('libopusenc')
conflicts=('libopusenc')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/libopusenc.git")
sha256sums=('SKIP')


pkgver() {
  cd "libopusenc"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libopusenc"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "libopusenc"

  make DESTDIR="$pkgdir" install

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libopusenc"
  rm "$pkgdir/usr/share/doc/libopusenc/COPYING"
}

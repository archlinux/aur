# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libopusenc-git
pkgver=0.1.1.r0.gb37719f
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
source=("git+https://git.xiph.org/libopusenc.git")
sha256sums=('SKIP')


pkgver() {
  cd "libopusenc"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libopusenc"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "libopusenc"

  make DESTDIR="$pkgdir" install

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libopusenc/COPYING"
  rm "$pkgdir/usr/share/doc/libopusenc/COPYING"
}

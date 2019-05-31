# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=opusfile-git
pkgver=0.11.r5.gd2577d7
pkgrel=2
pkgdesc="Stand-alone decoder library for .opus streams"
arch=('i686' 'x86_64')
url="https://opus-codec.org/"
license=('BSD')
depends=('glibc' 'libogg' 'openssl' 'opus')
makedepends=('git')
provides=('opusfile')
conflicts=('opusfile')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/opusfile.git")
sha256sums=('SKIP')


pkgver() {
  cd "opusfile"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "opusfile"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "opusfile"

  make DESTDIR="$pkgdir" install

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/opusfile"
  rm "$pkgdir/usr/share/doc/opusfile/COPYING"
}

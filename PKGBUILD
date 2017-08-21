# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=opusfile-git
pkgver=0.9.r0.g2c239eb
pkgrel=1
pkgdesc="Stand-alone decoder library for .opus streams"
arch=('i686' 'x86_64')
url="https://opus-codec.org/"
license=('BSD')
depends=('glibc' 'openssl' 'opus')
makedepends=('git')
provides=('opusfile')
conflicts=('opusfile')
options=('staticlibs')
source=("git+https://git.xiph.org/opusfile.git")
sha256sums=('SKIP')


pkgver() {
  cd "opusfile"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "opusfile"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "opusfile"

  make DESTDIR="$pkgdir" install

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/opusfile/COPYING"
  rm "$pkgdir/usr/share/doc/opusfile/COPYING"
}

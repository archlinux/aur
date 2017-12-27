# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtiff-git
pkgver=4.0.9.r32.g5848777b
pkgrel=1
pkgdesc="TIFF library and utilities"
arch=('i686' 'x86_64')
url="http://www.simplesystems.org/libtiff/"
license=('custom')
depends=('glibc' 'libjpeg' 'xz' 'zlib')
makedepends=('git')
provides=('libtiff')
conflicts=('libtiff')
options=('staticlibs')
source=("git+https://gitlab.com/libtiff/libtiff.git")
sha256sums=('SKIP')


pkgver() {
  cd "libtiff"

  git describe --long --tags | sed 's/^Release-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libtiff"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libtiff"

  make check
}

package() {
  cd "libtiff"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYRIGHT" "$pkgdir/usr/share/licenses/libtiff/COPYRIGHT"
}

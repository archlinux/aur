# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jansson-git
pkgver=2.12.r3.gb333f36
pkgrel=1
pkgdesc="C library for encoding, decoding and manipulating JSON data"
arch=('i686' 'x86_64')
url="https://digip.org/jansson/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('jansson')
conflicts=('jansson')
options=('staticlibs')
source=("git+https://github.com/akheron/jansson.git")
sha256sums=('SKIP')


pkgver() {
  cd "jansson"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jansson"

  autoreconf -fi
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd "jansson"

  make check
}

package() {
  cd "jansson"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/jansson"
}

# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=giflib-git
pkgver=5.2.1.r2.gadf5a1a
pkgrel=1
pkgdesc="A library and utilities for processing GIFs"
arch=('i686' 'x86_64')
url="http://giflib.sourceforge.net/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'docbook-xml' 'docbook-xsl' 'xmlto')
provides=('giflib' 'libgif.so')
conflicts=('giflib')
options=('staticlibs')
source=("git+https://git.code.sf.net/p/giflib/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "code"

  make
}

check() {
  cd "code"

  make check
}

package() {
  cd "code"

  make \
    PREFIX="/usr" \
    DESTDIR="$pkgdir" \
    install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/giflib"
}

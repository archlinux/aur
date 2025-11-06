# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=m2-planet
pkgver=1.13.1
pkgrel=1
pkgdesc="The PLAtform NEutral Transpiler"
arch=(x86_64)
license=('GPL-3.0-or-later')
url="https://github.com/oriansj/M2-Planet"
makedepends=(git)
depends=(glibc)
checkdepends=(mescc-tools)
source=(git+https://github.com/oriansj/M2-Planet.git#commit=bd2fe4b0659fd0ad3f476a5ad0ef801bd134665d)
sha256sums=('SKIP')
validpgpkeys=("CA1132DD2BA1E81AC10C95D35410E91C14959E87")

prepare() {
  cd M2-Planet
  git submodule init
  git submodule update
}

build() {
  cd M2-Planet
  CFLAGS+=" -Wl,-z,now"
  make
}

check() {
  cd M2-Planet
  make test
}

package() {
  cd M2-Planet
  make PREFIX=/usr DESTDIR=$pkgdir install
}

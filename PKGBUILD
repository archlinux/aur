# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=mescc-tools
pkgver=1.7.0
pkgrel=1
pkgdesc="Bootstrapping tools for Janneke's MES"
arch=(x86_64)
license=('GPL-3.0-or-later')
url="https://github.com/oriansj/mescc-tools"
makedepends=(git)
depends=(glibc)
source=(git+https://github.com/oriansj/mescc-tools.git#commit=5adfbf3364261a77109878a56b100aeeb6ef9ac4)
sha256sums=('SKIP')
validpgpkeys=("CA1132DD2BA1E81AC10C95D35410E91C14959E87")

prepare() {
  cd mescc-tools
  git submodule init
  git submodule update
}

build() {
  cd mescc-tools
  CFLAGS+=" -Wl,-z,now"
  make
}

check() {
  cd mescc-tools
  make test
}

package() {
  cd mescc-tools
  make PREFIX=/usr DESTDIR=$pkgdir install
}

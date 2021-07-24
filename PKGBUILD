# Maintainer: ziyazzz <dragonleoqinqin@gmail.com>

pkgname=espresso
pkgver=2.4
pkgrel=2
pkgdesc="A tool to produce a minimal equivalent representation of a Boolean function."
arch=("x86_64")
url="https://github.com/chipsalliance/espresso/"
license=("custom")
depends=("glibc")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chipsalliance/espresso/archive/v${pkgver}.tar.gz")
sha256sums=('27eb2a460877ffb7f92d0dfd44f2abf711e1de1de3de76d214d7bce5de605a1a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -Bbuild \
    -DCMAKE_INSTALL_BINDIR=/usr/bin \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -DCMAKE_C_FLAGS="$LDFLAGS"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake --build .
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build"
    ctest
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  DESTDIR="$pkgdir" cmake --install .
}

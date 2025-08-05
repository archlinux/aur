# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=annobin
pkgver=12.98
pkgrel=1
pkgdesc="A binary annotation and examination package."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://sourceware.org/$pkgname
license=(GPL3)
depends=(rpm-tools)
optdepends=(
    'gcc: gcc plugin'
)
source=($pkgname-$pkgver.tar.xz::https://nickc.fedorapeople.org/$pkgname-$pkgver.tar.xz)
sha256sums=('f31b46219f7947fce12abb6a114b0b9c4f7a19af834a5ab376be15e0c4fbdc8b')

build() {
  cd $pkgname-$pkgver
#  ./autogen.sh
  ./configure --prefix=/usr --without-clang-plugin --without-llvm-plugin --with-debuginfod=no
  make
}
# fails since 12.82
# https://sourceware.org/bugzilla/show_bug.cgi?id=32605
_check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

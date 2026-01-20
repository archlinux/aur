# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=annobin
pkgver=13.05
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
sha256sums=('9a31ccf41e151628578b688363e9da0d933474cc8e074fad9ea16b0f7fb67bd1')

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

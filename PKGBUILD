# Maintainer:  dreieck
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Ross Gauchemann <hurrr@yahoo.com>

pkgname=a2png
pkgver=0.1.5
pkgrel=6
pkgdesc="Converts text into bitmap images such as PNG."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/a2png/files/"
license=('GPL-2.0-only')
depends=(
  'glibc'
  'libcairo.so'
)
makedepends=(
  'cairo'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('d3ae1c771f5180d93f35cded76d9bb4c4cc2023dbe65613e78add3eeb43f736b')

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -Wno-implicit-function-declaration -Wno-error=implicit-function-declaration"
  export CFLAGS
  ./configure --prefix=/usr \
    --enable-cairo \
    --with-cairo-include=/usr/include/cairo \
    --with-cairo-lib=/usr/lib/
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


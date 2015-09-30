# Maintainer: Tetsumi <tetsumi@vmail.me>
# Maintainer: Bart Verhoeven <bartverhoeven@live.com>

pkgname=mercury
pkgver=14.01.1
pkgrel=2
pkgdesc="The mercury language compiler."
arch=('i686' 'x86_64')
url="http://www.mercurylang.org/"
license=('GPL')
depends=('gcc' 'make')
makedepends=('flex' 'bison')
source=(http://dl.mercurylang.org/release/mercury-srcdist-${pkgver}.tar.gz)
sha256sums=('98f7cbde7a7425365400feef3e69f1d6a848b25dc56ba959050523d546c4e88b')

build() {
  cd "$srcdir"/mercury-srcdist-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --disable-inefficient-grades

  make PARALLEL="$MAKEFLAGS"
}

package() {
  cd "$srcdir"/mercury-srcdist-$pkgver

  make INSTALL_PREFIX="$pkgdir"/usr \
       INSTALL_MAN_DIR="$pkgdir"/usr/share/man \
       INSTALL_INFO_DIR="$pkgdir"/usr/share/info \
       MERCURY_COMPILER="$pkgdir"/usr/bin/mercury_compile \
       MERCURY_CONFIG_DIR="$pkgdir"/usr/lib/mercury \
       PARALLEL="$MAKEFLAGS" install

  rm "${pkgdir}"/usr/bin/{mdb,mercury,mprof}.bat
}
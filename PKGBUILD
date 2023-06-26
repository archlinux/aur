# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcmatroska2
_pkgname=bcmatroska2
pkgver=5.2.1
pkgrel=1
pkgdesc="A C library for working with matroska files"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
makedepends=('cmake')
depends=('glibc')
source=("https://gitlab.linphone.org/BC/public/bcmatroska2/-/archive/$pkgver/bcmatroska2-$pkgver.tar.gz")
sha256sums=('473aa34b66c5b138a882afaa2d16feb042a7df8b71542566d53d80ae745d051a')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC=NO \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -z muldefs" \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

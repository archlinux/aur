# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcmatroska2
_pkgname=bcmatroska2
pkgver=5.4.60
pkgrel=1
pkgdesc="A C library for working with matroska files"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL-2.0-or-later')
makedepends=('cmake')
depends=('bctoolbox' 'glibc')
source=("https://gitlab.linphone.org/BC/public/bcmatroska2/-/archive/$pkgver/bcmatroska2-$pkgver.tar.gz")
sha256sums=('7599c0cb44f51cf36049776bd8ad904a8d1f922690bff7375a0af2f84fed962e')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_SHARED_LIBS=YES \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -z muldefs" \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

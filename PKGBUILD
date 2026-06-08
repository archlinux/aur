# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcmatroska2
_pkgname=bcmatroska2
pkgver=5.4.118
pkgrel=1
pkgdesc="A C library for working with matroska files"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL-2.0-or-later')
makedepends=('cmake')
depends=('bctoolbox' 'glibc')
source=("https://gitlab.linphone.org/BC/public/bcmatroska2/-/archive/$pkgver/bcmatroska2-$pkgver.tar.bz2")
sha256sums=('9111d385259302d93bf73743f6ae9c93b346dab0d1c80fb76d4bcb3af70f63ee')

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

# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcmatroska2
_pkgname=bcmatroska2
pkgver=5.4.9
pkgrel=1
pkgdesc="A C library for working with matroska files"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL-2.0-or-later')
makedepends=('cmake')
depends=('bctoolbox' 'glibc')
source=("https://gitlab.linphone.org/BC/public/bcmatroska2/-/archive/$pkgver/bcmatroska2-$pkgver.tar.gz")
sha256sums=('54b99499a7a479ffdbb07210a6b2d25fa3dd3274fd18e98294dcd9d9bccc7193')

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

# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcmatroska2-git
_pkgname=bcmatroska2
pkgver=5.2.1.r0.g4d125bf
pkgrel=1
pkgdesc="A C library for working with matroska files"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
makedepends=('cmake')
depends=('glibc')
source=("git+https://gitlab.linphone.org/BC/public/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cmake -B build "$_pkgname" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC=NO \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -z muldefs" \
    -Wno-dev
    #-DCMAKE_C_FLAGS="${CFLAGS} -DFILE_EXPORTS -DDLLEXPORT=extern" \
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

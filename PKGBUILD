# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=b-em
pkgver=20251010_0b6f1d2
_tarball=0b6f1d2112a40cbed688ce6abaa6a10a00faeb2e
pkgrel=1
pkgdesc="BBC Micro emulator"
arch=('x86_64')
url="https://github.com/stardot/b-em"
license=('GPL-2.0-or-later')
depends=(allegro alsa-lib gcc-libs glibc jack zlib)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
source=(https://github.com/stardot/b-em/archive/${_tarball}/b-em-${_tarball}.tar.gz)
noextract=()
sha256sums=(fd51c4cf1555d824168da81d19535044a2fba001a322c3b46eb420258f8f7f9f)

prepare() {
  cd "${srcdir}"
  tar -xf ${pkgname}-${_tarball}.tar.gz -C "${srcdir}"
}

build() {
  cd "${srcdir}/${pkgname}-${_tarball}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_tarball}"
  make install DESTDIR="$pkgdir"
  mkdir -p ${pkgdir}/usr/share/pixmaps
  cp icon/b-em.png ${pkgdir}/usr/share/pixmaps
  mkdir -p ${pkgdir}/usr/share/applications
  cp ../../B-em.desktop ${pkgdir}/usr/share/applications
}

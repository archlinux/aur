# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=b-em
pkgver=20250603_40246d4
_tarball=40246d424e3c0c62a2f2aeb3a9698702ef4d9da2
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
sha256sums=(30363f04e48fceac9c8d69df74562e071b0256b19d70841625a32d06d50ce362)

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

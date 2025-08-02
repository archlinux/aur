# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=b-em
pkgver=20250729_bfa2d43
_tarball=bfa2d43f7ce444a078cef27143d5476fb1619208
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
sha256sums=(23cc7587024f6db5ef8466c072f21594afa5e88b03c85cf9910a5f2794e24d27)

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

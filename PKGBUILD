# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=b-em
pkgver=20251008_4e7eaac
_tarball=4e7eaac7acf8cbc7260a4c355d3ccb8d8c73c5c5
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
sha256sums=(41258c96ea604365fa9f358b156f4f4a3560ea36c343f23487e95c92bbfe8db2)

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

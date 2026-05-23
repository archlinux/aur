# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=b-em
pkgver=20260521_05e762b
_tarball=05e762b7b8d2dae59e3d3aa98484e5b8036ed274
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
sha256sums=(dbede8ed4bd01a95d27da468ecaad237b613226767bb619077dbef2e40c1162c)

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

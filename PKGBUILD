# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=grfcodec
pkgver=6.0.5
pkgrel=1
pkgdesc="A tool to convert a GRF file into graphics files and meta data, and vice versa"
arch=('i686' 'x86_64')
url="http://dev.openttdcoop.org/projects/grfcodec"
license=('GPL2')
makedepends=('boost')
provides=("nforenum")
conflicts=('nforenum')
replaces=('nforenum')
source=("http://binaries.openttd.org/extra/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
sha256sums=('cbaaac92b0aece463de8a4b0a43bdf01c7dd1081cb48fbda6dad1c8e27ad17a6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's@/usr/local@/usr@' Makefile.bundle
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

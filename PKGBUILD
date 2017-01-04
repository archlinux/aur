# Maintainer Dan T. <dnt@tuta.io>
# Credit to 6.0.5 maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=grfcodec
pkgver=6.0.6
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
sha256sums=('38c2a1c9a0a5910d901a6114479211a90c4aaeb34078a5d80afe21d62e6e4e15')

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

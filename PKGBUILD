# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=grfcodec
pkgver=6.0.4
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
sha256sums=('824094035ae9209c081f6eda5dde11abee387289b62fd49341a845c2da008db0')

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

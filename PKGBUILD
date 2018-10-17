# Maintainer: Mark Weiman <mark.weiman@markzz.com>

pkgname=corsaro
pkgver=2.1.0
pkgrel=3
pkgdesc="A software suite for performing large-scale analysis of trace data"
arch=('i686' 'x86_64')
url="https://www.caida.org/tools/measurement/corsaro/"
depends=('libtrace')
license=('GPL2')
source=("https://www.caida.org/tools/measurement/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz"
        0001-cors-trace2tuple.c-Remove-missing-header.patch
        0002-Removes-include-to-config.h-in-public-headers.patch
        0003-corsaro_flowtuple.h-Remove-includes-to-unavailable-h.patch)
md5sums=('f4970360525b5d112a1040a27503e87f'
         '4ea8f2e5a1bd608e8a65e8f7dbd9a2f8'
         '440716d2539a211ad4105d4ff7bac9b1'
         '27ebf0e1d74a5daa98a6812cb540dade')

build() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../0001-cors-trace2tuple.c-Remove-missing-header.patch
  patch -p1 -i ../0002-Removes-include-to-config.h-in-public-headers.patch
  patch -p1 -i ../0003-corsaro_flowtuple.h-Remove-includes-to-unavailable-h.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

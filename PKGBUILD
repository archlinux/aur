# Maintainer:  Emanuel Schmidt <eschmidt216@gmail.com>

pkgname=liba53
pkgver=4.0.0
pkgrel=1
pkgdesc='A5/3 call encryption library'
depends=()
url='https://github.com/RangeNetworks/liba53'
license=('GPL')
makedepends=('gcc' 'make' 'pkgconfig')
arch=('x86_64')
provides=('liba53.so=1-64')
source=("https://github.com/RangeNetworks/liba53/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ec85939d6d4225151ba7b15585b93af94d4f6cc823ab23666cb73da0f808965b8bc8c4472471af58129548399bcd9b2d13867f77bd20543adf1d8c1757f4095e')
b2sums=('4189bd00644269714b323fae3ce316a2e2b7df660599f612fa3b8056373e2c99aeda2000de78d52c2ae19531ba3e73ee7404c488ffd9b5f47471110953078146')

prepare () {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/DESTDIR :=//g' Makefile
  export DESTDIR="${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/include"
  make install

  # Does not work with custom install-directory
#  make installtest

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"

}

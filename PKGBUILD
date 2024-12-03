# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tcptrack
pkgver=1.4.3
pkgrel=2
pkgdesc="A sniffer which displays information about TCP connections it sees on a network interface"
arch=('i686' "x86_64")
url="https://github.com/bchretien/tcptrack"
license=('GPL-2.1')
depends=('libpcap')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" Fix-printf-format-ftbfs.patch)
sha256sums=('8725205ecbeddc3f891e3345e70f150d87705b099eafd8780f4739ab14f8c862'
            'c278676f1751f7e5c397f59d460662ca03f45c48b0dc2126efdba386eb05b44c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "..//Fix-printf-format-ftbfs.patch"
  ./configure --prefix=/usr
  #  sed -i 's/%ds/%zus/' src/TextUI.cc
  #  sed -i 's/%dm/%zum/' src/TextUI.cc
  #  sed -i 's/%dh/%zuh/' src/TextUI.cc
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
# vim:set ts=2 sw=2 et:

# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=dhcp_probe
pkgver=1.3.1
pkgrel=1
pkgdesc="Discover DHCP and BootP servers on a directly-attached Ethernet network"
arch=('x86_64')
url="https://www.net.princeton.edu/software/dhcp_probe/"
license=('GPL2')
depends=('glibc' 'libnet')
makedepends=('libpcap')
source=("https://www.net.princeton.edu/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1002683e6ceb3806289fa9e4879be3d957a9ddc42656d7114942708560f8efba0db058137e04cad092e5a083900987aa1f76c5a7c20db4b57c104dd6a6fcabb6')
b2sums=('86c079c4c7951f3a70ced20dbea5d4f0d716335d2f9a18b1b9986965ca0446b5a7b673c7e652405deceeef336218016418a86be1a76d452c7802061403a66e82')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  depends+=('libpcap.so')

  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,PLATFORMS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim:set ts=2 sw=2 et:

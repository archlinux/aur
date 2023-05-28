# -*- mode: shell-script -*-
pkgbase=libnetceiver
pkgname=($pkgbase $pkgbase-tools)
pkgver=0.0.3
pkgrel=1
pkgdesc='Library and tools to access the REEL NetCeiver'
url='https://github.com/vdr-projects/libnetceiver'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL2.1')
makedepends=('libxml2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/libnetceiver/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9e7e5d35245016735ff5949b7e389588ed735c60c041411d66b5a885650671c1')

build() {
  cd "${srcdir}/$pkgbase-$pkgver"
  make
}

package_libnetceiver() {
  pkgdesc='NetCeiver client protocol library'
  depends=('libxml2')
  replaces=('libmcli')
  provides=('libmcli')

  cd "${srcdir}/$pkgbase-$pkgver/lib"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

package_libnetceiver-tools() {
  pkgdesc='NetCeiver client protocol library tools'
  depends=('libnetceiver' 'libxml2' 'lftp')

  cd "${srcdir}/$pkgbase-$pkgver/tools"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

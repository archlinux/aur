# -*- mode: shell-script -*-
pkgbase=libnetceiver
pkgname=($pkgbase $pkgbase-tools)
pkgver=0.0.9
pkgrel=1
pkgdesc='Library and tools to access the REEL NetCeiver'
url='https://github.com/vdr-projects/libnetceiver'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL2.1')
makedepends=('libxml2')
options=('!staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/libnetceiver/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0da7fd22943d0a2fc7c6d5f825715f49f3a201e27acd7635e234a30f98e3eb43')

build() {
  cd "${srcdir}/$pkgbase-$pkgver"
  make
}

package_libnetceiver() {
  pkgdesc='NetCeiver client protocol library'
  optdepends=('libnetceiver-tools: Tools to maintain a netceiver')
  depends=('libxml2')
  replaces=('libmcli')
  provides=('libmcli')
  conflicts=('libmcli')

  cd "${srcdir}/$pkgbase-$pkgver/lib"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

package_libnetceiver-tools() {
  pkgdesc='NetCeiver client protocol library tools'
  depends=('libnetceiver' 'glibc' 'tnftp6')

  cd "${srcdir}/$pkgbase-$pkgver/tools"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

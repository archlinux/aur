# -*- mode: shell-script -*-
pkgbase=libnetceiver
pkgname=($pkgbase $pkgbase-tools)
pkgver=0.0.7
pkgrel=2
pkgdesc='Library and tools to access the REEL NetCeiver'
url='https://github.com/vdr-projects/libnetceiver'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL2.1')
makedepends=('libxml2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/libnetceiver/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b420a98b9f7c10c90d8506a8e6f59de506eaa6dfab2fbb7e499b91e291a64f83')

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

# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Gerhard Brauer <gerhard.brauer@web.de>
# Contributor: Aitor <aitor.iturri@gmail.com>

pkgname=libcdk
_pkgver=5.0-20240331
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Curses Development Kit - widget library, enhanced version'
arch=(x86_64 i686)
url="https://invisible-island.net/cdk/"
license=('custom:BSD-like')
options=('!emptydirs')
source=("${pkgname}.${pkgver}.tar.gz::https://invisible-island.net/archives/cdk/cdk-${_pkgver}.tgz")
sha256sums=('8c5d7c6138ae3d76cf149027e1b10a6727c52fd0a7177fca934436890bb0f2de')

build() {
  cd "cdk-${_pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "cdk-${_pkgver}"

  make DOCUMENT_DIR="$pkgdir/usr/share/doc/cdk" DESTDIR="$pkgdir" install \
    installCDKSHLibrary
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

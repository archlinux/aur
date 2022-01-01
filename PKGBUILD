# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Gerhard Brauer <gerhard.brauer@web.de>
# Contributor: Aitor <aitor.iturri@gmail.com>

pkgname=libcdk
_pkgver=5.0-20211216
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Curses Development Kit - widget library, enhanced version'
arch=(x86_64 i686)
url="https://invisible-island.net/cdk/"
license=('custom:BSD-like')
options=('!emptydirs')
source=("${pkgname}.${pkgver}.tar.gz::ftp://ftp.invisible-island.net/cdk/cdk-${_pkgver}.tgz")
sha256sums=('aeec4d9be2255970c8dca0785a0a996f0d242eb4f73cf927a3ec04997a3e63e8')

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

# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Gerhard Brauer <gerhard.brauer@web.de>
# Contributor: Aitor <aitor.iturri@gmail.com>

pkgname=libcdk
_pkgver=5.0-20221018
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Curses Development Kit - widget library, enhanced version'
arch=(x86_64 i686)
url="https://invisible-island.net/cdk/"
license=('custom:BSD-like')
options=('!emptydirs')
source=("${pkgname}.${pkgver}.tar.gz::ftp://ftp.invisible-island.net/cdk/cdk-${_pkgver}.tgz")
sha256sums=('b0318557ff882df5199cdfb678bc8c4f5fa639a1f29948b6be360826950560fd')

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

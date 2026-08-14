# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sematre <sematre at gmx dot de>

pkgname=dvdisaster-speed47
_pkgver=0.79.10-pl6
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches, speed47 fork"
arch=(x86_64)
url="https://github.com/speed47/dvdisaster"
license=(GPL-3.0-or-later)
depends=(
    cairo
    glib2
    glibc
    gtk3
    pango
    )
provides=(dvdisaster)
conflicts=(dvdisaster)
source=("dvdisaster-speed47-${pkgver}.tar.gz::https://github.com/speed47/dvdisaster/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('f302b92df53abde1fb239230fc4c8b1fc425405c0ba59da3e2ba85c30f5320cc')

build() {
  cd "dvdisaster-${_pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "dvdisaster-${_pkgver}"
  make DESTDIR="${pkgdir}/" install
  rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"
  install -Dm644 contrib/dvdisaster.desktop -t "${pkgdir}/usr/share/applications"
}

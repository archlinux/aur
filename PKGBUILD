# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sematre <sematre at gmx dot de>

pkgname=dvdisaster-speed47-git
pkgver=0.79.10.pl3.r6.g063ad92
pkgrel=2
pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches, speed47 fork"
arch=(x86_64)
url="https://github.com/speed47/dvdisaster"
license=(GPL-3.0-or-later)
depends=(gtk2)
makedepends=(git)
provides=(dvdisaster)
conflicts=(dvdisaster)
source=("git+https://github.com/speed47/dvdisaster.git")
sha256sums=('SKIP')

pkgver() {
  cd dvdisaster
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dvdisaster
  ./configure --prefix=/usr
  make
}

package() {
  cd dvdisaster
  make DESTDIR="${pkgdir}/" install
  rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"
  install -Dm644 contrib/dvdisaster.desktop -t "${pkgdir}/usr/share/applications"
}

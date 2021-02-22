# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
# Contributor: Levente Polyak <anthraxx@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
pkgname=dmenu-xresources
pkgver=5.0
pkgrel=2
pkgdesc='Case insensitive menu for X, configured via .Xresources'
url='https://tools.suckless.org/dmenu/'
arch=('x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
source=(https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-4.9.diff https://tools.suckless.org/dmenu/patches/case-insensitive/dmenu-caseinsensitive-${pkgver}.diff)
sha256sums=('fe18e142c4dbcf71ba5757dbbdea93b1c67d58fc206fc116664f4336deef6ed3' '75b884e26c959f396676110eb5e0b74bdec43b1cb9424950f08cc641e6fb63d6' '4c7ff71e823190527ecea0eea884a340b9a08c79589592a7a298eb9b13a86745')
prepare() {
  cd dmenu-${pkgver}
  patch < "../dmenu-xresources-4.9.diff"
  patch < "../dmenu-caseinsensitive-${pkgver}.diff"
  echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
  echo "CFLAGS+=${CFLAGS}" >> config.mk
  echo "LDFLAGS+=${LDFLAGS}" >> config.mk
}
build() {
  cd dmenu-${pkgver}
  make \
	  X11INC=/usr/include/X11 \
	  X11LIB=/usr/lib/X11 \
	  FREETYPEINC=/usr/include/freetype2
}
package() {
  cd dmenu-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/dmenu-xresources"
}
# vim: set ft=sh

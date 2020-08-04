# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
# Contributor: Levente Polyak <anthraxx@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu-xresources
pkgver=4.9
pkgrel=3
pkgdesc='Case insensitive menu for X, configured via .Xresources'
url='https://tools.suckless.org/dmenu/'
arch=('x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
source=(https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-${pkgver}.diff https://tools.suckless.org/dmenu/patches/case-insensitive/dmenu-caseinsensitive-20200523-db6093f.diff https://tools.suckless.org/dmenu/patches/mouse-support/dmenu-mousesupport-${pkgver}.diff)
sha256sums=('b3971f4f354476a37b2afb498693649009b201550b0c7c88e866af8132b64945' '75b884e26c959f396676110eb5e0b74bdec43b1cb9424950f08cc641e6fb63d6' '31d108e1cd9b0dd739f41a4aabbab65716f4860d5311f698d8e9828c070a5c38' '5e12078939d4d229eebe4cf5054c886176f77f2a381e2d68e04c3fa338079212')

prepare() {
  cd dmenu-${pkgver}
  patch < "../dmenu-xresources-${pkgver}.diff"
  patch < "../dmenu-caseinsensitive-20200523-db6093f.diff"
  patch < "../dmenu-mousesupport-${pkgver}.diff"
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

# vim: ts=2 sw=2 et:

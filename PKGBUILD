# Maintainer: William Brown <plshelpme19132@protonmail.com>
# Contributor: Levente Polyak <anthraxx@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu-xresources
pkgver=4.9
pkgrel=1
pkgdesc='Generic menu for X, configured via .Xresources'
url='https://tools.suckless.org/dmenu/'
arch=('x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
source=(https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-${pkgver}.diff)
sha512sums=('c2779209fe012de8ca1cdd72923da6d594f4a8368c85c3c0e0afd4ae489a95fe0e6f05a947d115b6b389aa7170ab14c2c645a2031353b0a08f38327ab461fe65' 'SKIP')

prepare() {
  cd dmenu-${pkgver}
  patch < "../dmenu-xresources-${pkgver}.diff"
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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/dmenu"
}

# vim: ts=2 sw=2 et:

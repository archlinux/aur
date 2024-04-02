# Maintainer: Jay Tauron <jytrn@protonmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=nordmenu
pkgver=5.3.1
pkgrel=2
pkgdesc='Generic menu for X with Nord colours'
url='https://github.com/0jdxt/nordmenu'
arch=('x86_64')
license=('MIT')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
source=($pkgname-$pkgver::https://github.com/0jdxt/nordmenu/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('ed98490fc1b265c09a15b4c213434de2d07d3ad1b24b71a7ecc3538efd5c03a4b27f70392388fa29371142656f843482205e55e6f51f7096a3b12695a6257e15')
b2sums=('0dcef658811eb5256df5ab29af547ac372f2c7cfc703ce2a0fba6053f2e39b8abd4174d7f63b04e3c5b2844faa7067a3e0d32016890a2826b3e40b5b9e521e45')
provides=('dmenu')
conflicts=('dmenu')

prepare() {
  cd ${pkgname}-${pkgver}
  echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
  echo "CFLAGS+=${CFLAGS}" >> config.mk
  echo "LDFLAGS+=${LDFLAGS}" >> config.mk
}

build() {
  cd ${pkgname}-${pkgver}
  make \
	  X11INC=/usr/include/X11 \
	  X11LIB=/usr/lib/X11 \
	  FREETYPEINC=/usr/include/freetype2
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

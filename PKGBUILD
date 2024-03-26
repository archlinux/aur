# Maintainer: Jay Tauron <jytrn@protonmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=nordmenu
pkgver=5.3
pkgrel=1
pkgdesc='Generic menu for X with Nord colours'
url='https://github.com/0jdxt/nordmenu'
arch=('x86_64')
license=('MIT')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
source=($pkgname-$pkgver::https://github.com/0jdxt/nordmenu/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('ed2c6831630bdea16fa0b656a72463fdfaee1429be3ffa6c55f02c6a02045957b49beeb2b2b660c637d2ea6e45ab50f076d6183285de25cfde5719d8a4b04873')
b2sums=('a404e68fcd8a81bdc356afe11d60f2a79f934c3cc7b10d1729746392e28ad1ed878b21546f2c50bdbe8388d507ae070a1c464b7c4a1eccefa9a4cece5ff9a351')
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

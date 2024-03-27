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
sha512sums=('caad25358fc2d955f14aad97afb75641314f30403cb28bc28001fb262b02a93f3b95ca6e231f0a99163244e21c0cb6e81fa8c653d9275306cfe22193dd91122b')
b2sums=('167912cb8de9cd02f648b3f3503ba15170e8579eee4b3e379ed183c31692142a6bcce82ecedbbd548dc2ac05ae5dc9004b83b074bfe81254070cfbdeeea65b9d')
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

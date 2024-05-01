# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu
pkgver=5.3
pkgrel=3
pkgdesc='Generic menu for X'
url='https://tools.suckless.org/dmenu/'
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
source=("git+https://git.suckless.org/dmenu#tag=${pkgver}")
sha512sums=('781f4aab2bb32c39e79a2269b62fdb8cacdcebc162f73844e0ff86f8d084fd151eb63811e0f4de906ae5b3ca3a02f12c82fbf4d9f5f3e4a9b5d847de787aefd4')
b2sums=('6da7112a8975c152038f7694f1a658674f92c2d5a9340f97e8b64430a2fce612c87effd361078b66ce77510d6bb6478c47ea3b1d6ee0adfafa1e8c0d62f1adb5')

prepare() {
  cd ${pkgname}
  echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
  echo "CFLAGS+=${CFLAGS}" >> config.mk
  echo "LDFLAGS+=${LDFLAGS}" >> config.mk
}

build() {
  cd ${pkgname}
  make \
	  X11INC=/usr/include/X11 \
	  X11LIB=/usr/lib/X11 \
	  FREETYPEINC=/usr/include/freetype2
}

package() {
  cd ${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

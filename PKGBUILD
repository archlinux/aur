# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu
pkgver=5.3
pkgrel=1
pkgdesc='Generic menu for X'
url='https://tools.suckless.org/dmenu/'
arch=('x86_64')
license=('MIT')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
source=(https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz)
sha512sums=('60f758134063ad7f304fbb0785c66dddc21461e5e5014f8735cf6d5c95dc22a177f069d48101e633ddffe5bbefc1118a2bf8b31daaf7b6438fdf6fe1bcb5d61c')
b2sums=('fd76b0b11a153f98dd58ec888820bc8a0ebc67f814cdf2d13a35ea3addcc3ad423bb9b2f4f73897cf6293e61a507900e7b7fec65e4f0acd15cc8e425f5506faa')

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

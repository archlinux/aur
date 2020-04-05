# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-input-joystick
pkgver=1.6.3
pkgrel=2
pkgdesc="X.Org Joystick input driver"
arch=(i686 x86_64)
url="https://www.x.org/wiki/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.1' 'xorgproto')
conflicts=('X-ABI-XINPUT_VERSION<24.1' 'X-ABI-XINPUT_VERSION>=25')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>
source=(https://www.x.org/releases/individual/driver/xf86-input-joystick-$pkgver.tar.bz2{,.sig}
        '50-joystick.conf')
sha512sums=('541c993bd37dd74d96d90060407d9fb9ebd3fbca352189a08c6b0c899c84609a1b5a3c1ea3febb4ceb5e2b881b54e45c75b8f9b2e475e16d7cffbbe42a3221e5'
            'SKIP'
            '11c5da4ab3e8b1e25a6e42ddf9addb1ed44ad203c9374b4acd4a4f8e25761151ddc649acf857b6e4a0a381c5665a03bda9b9abf2d148cc002d10acc891f3ad13')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/X11/xorg.conf.d"
  install -m644 "${srcdir}/50-joystick.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/"

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# Maintainer: BoBeR182 <aur AT nullvoid DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrés Cordero <arch@andrew67.com>
# Contributor: Jens Pranaitis <jens@chaox.net>

pkgname=mdk3
pkgver=v6
pkgrel=10
pkgdesc="WLAN penetration tool"
url="https://www.kali.org/tools/mdk3/"
arch=("x86_64")
license=('GPL2')
depends=('glibc' 'aircrack-ng')
source=(https://salsa.debian.org/pkg-security-team/${pkgname}/-/archive/debian/master/${pkgname}-debian-master.tar.bz2)
sha512sums=('b5bb0e7d86e1bd9f5ccd9a7c4a7c3dfdce1b2fe4c86d5a7fdf0928c5b49ed892d2cb7be39b0e49018e29320a5819432f9422e79bbd15c351ce4abcb796f5c7e9')

prepare() {
  cd ${pkgname}-debian-master
  sed 's|sbin|bin|g' -i Makefile
}


build() {
  cd ${pkgname}-debian-master
  make -C osdep
  make
}
package() {
  cd ${pkgname}-debian-master
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm 644 docs/*.html -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

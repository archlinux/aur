# Maintainer: BoBeR182 <aur AT nullvoid DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrés Cordero <arch@andrew67.com>
# Contributor: Jens Pranaitis <jens@chaox.net>

pkgname=mdk3
pkgver=v6
pkgrel=9
pkgdesc="WLAN penetration tool"
url="https://www.kali.org/tools/mdk3/"
arch=("x86_64")
license=('GPL2')
depends=('glibc' 'aircrack-ng')
source=(https://salsa.debian.org/pkg-security-team/${pkgname}/-/archive/debian/master/${pkgname}-debian-master.tar.bz2)
sha512sums=('fb7902654b263b4c4a90b4e7c590699678fc57a29bdba79bece89330d39b2019f4655c0ddfc6c7f9f0b61419fec37e195de503a7d0cad4c765f9ddeb9b22cede')

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

# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxappearance-gtk2
pkgver=0.6.4
pkgrel=1
pkgdesc='Feature-rich GTK2 theme switcher of the LXDE Desktop'
arch=('x86_64')
license=('GPL-2.0-or-later')
url="http://www.lxde.org/"
depends=('gtk2')
makedepends=('dbus-glib'
             'git' 
             'intltool')
conflicts=('lxappearance')
source=("git+https://github.com/lxde/lxappearance.git#tag=${pkgver}")
sha512sums=('1c592214bf4f409af1ee11cb06788ead4e21c77ea979b1b1322008fdfe271a45e01f8737e570de64c345297c6a8d1f44e931d3da3b3aa9729ca13b90c4939ed4')

prepare() {
  mv "${pkgname%-gtk2}" "${pkgname}"
  cd "${pkgname}"
  autoreconf -fiv
}

build() {
  cd "${pkgname}"
  ./configure \
	  --sysconfdir=/etc \
	  --prefix=/usr \
	  --enable-dbus
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtkhtml3
pkgver=3.32.2
pkgrel=7
pkgdesc="A lightweight HTML renderer/editor widget for GTK2"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gconf' 'gtk2' 'gnome-icon-theme' 'enchant' 'iso-codes' 'libsoup')
makedepends=('intltool')
replaces=('gtkhtml')
conflicts=('gtkhtml4')
url='https://github.com/GNOME/gtkhtml'
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname//3/}/3.32/${pkgname//3/}-${pkgver}.tar.bz2)
sha256sums=('8746053cf709e1de37c7ac775ab1364ddda4b75167660ed7f98a237b3797e39f')

build() {
  cd "${srcdir}/${pkgname//3/}-${pkgver}"
  CFLAGS+=" -lgthread-2.0" ./configure --prefix=/usr --sysconfdir=/etc \
	      --libexecdir=/usr/lib/gtkhtml \
	      --localstatedir=/var --disable-static \
	      --disable-deprecated-warning-flags
  make
}

package() {
  cd "${srcdir}/${pkgname//3/}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtkhtml3
pkgver=3.32.2
pkgrel=8
pkgdesc="A lightweight HTML renderer/editor widget for GTK2"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gconf' 'gtk2' 'gnome-icon-theme' 'enchant' 'iso-codes' 'libsoup')
makedepends=('intltool')
replaces=('gtkhtml')
conflicts=('gtkhtml4')
url='https://gitlab.gnome.org/Archive/gtkhtml'
source=("https://gitlab.gnome.org/Archive/${pkgname/%3/}/-/archive/GTKHTML_${pkgver//./_}/${pkgname/%3/}-GTKHTML_${pkgver//./_}.tar.bz2")
sha256sums=('a5b4793d6bcea074d6e06024f6c6fb0310642a48dc99a2e209397df0a4fbebe9')

build() {
  cd "${pkgname/%3/}-GTKHTML_${pkgver//./_}/gtkhtml"
  ./autogen.sh
  CFLAGS+=" -lgthread-2.0" ./configure --prefix=/usr --sysconfdir=/etc \
	      --libexecdir=/usr/lib/gtkhtml \
	      --localstatedir=/var --disable-static \
	      --disable-deprecated-warning-flags
  make
}

package() {
  cd "${pkgname/%3/}-GTKHTML_${pkgver//./_}"
  make DESTDIR="$pkgdir" install
}

# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@soulfly.nl>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=genius
pkgver=1.0.27
pkgrel=3
pkgdesc="Advanced calculator including a mathematical programming language"
url="https://www.jirka.org/genius.html"
arch=('x86_64')
license=('GPL')
depends=('mpfr' 'glib2' 'hicolor-icon-theme' 'gtk3' 'vte3' 'gtksourceview4' 'termcap')
makedepends=('intltool' 'gtk-update-icon-cache' 'python')
source=(https://download.gnome.org/sources/genius/1.0/${pkgname}-${pkgver}.tar.xz)
sha256sums=('0243b7c36b5f9e930c62778acd52deb188deeca704a5e195337018435d9e7bb5')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/genius \
      --localstatedir=/var --disable-static \
      --disable-update-mimedb
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}

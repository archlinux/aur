# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-engines
pkgver=2.21.0
pkgrel=4
pkgdesc="Theme engines for GTK+ 2"
arch=(x86_64)
license=('GPL' 'LGPL')
depends=('gtk2>=2.24.0')
makedepends=('pkg-config' 'intltool' 'gnome-common' 'git')
url="http://live.gnome.org/GnomeArt"
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2')
replaces=('lighthouse-gtk2')
source=('git+https://github.com/GNOME/gtk-engines.git#commit=e23eb81ade8c815dcd4da026ab7a2b7307a4f326')
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --enable-animation
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}

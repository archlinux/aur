# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg-git
pkgver=2.40.13.r4.g7948f3b
pkgrel=1
pkgdesc="A SVG viewing library"
arch=(i686 x86_64)
license=('LGPL')
depends=('gdk-pixbuf2' 'pango' 'libcroco')
makedepends=('intltool' 'gobject-introspection' 'vala' 'python2' 'git' 'gnome-common')
options=('!emptydirs')
provides=('librsvg')
conflicts=('librsvg')
url="https://live.gnome.org/LibRsvg"
install=librsvg.install
source=($pkgname::git://git.gnome.org/librsvg)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-vala
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# $Id: PKGBUILD 252139 2015-12-02 21:33:21Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg-git
pkgver=2.40.15.r9.g5183f46
pkgrel=1
pkgdesc="A SVG viewing library"
arch=(i686 x86_64)
license=('LGPL')
depends=('gdk-pixbuf2' 'pango' 'libcroco')
makedepends=('intltool' 'gobject-introspection' 'vala' 'python2' 'git')
options=('!emptydirs')
url="https://live.gnome.org/LibRsvg"
install=librsvg.install
provides=('librsvg')
conflicts=('librsvg')
source=("$pkgname::git://git.gnome.org/librsvg")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -r 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr --disable-static --enable-vala --disable-tools
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

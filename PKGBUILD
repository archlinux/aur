# $Id: PKGBUILD 252139 2015-12-02 21:33:21Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg-git
_pkgname=librsvg
pkgver=2.46.0.r79.g4df27786
pkgrel=1
pkgdesc="A SVG viewing library"
arch=(i686 x86_64)
license=('LGPL')
depends=('gdk-pixbuf2' 'pango' 'libcroco')
makedepends=('intltool' 'gobject-introspection' 'vala' 'python2' 'git' 'cargo' 'gtk-doc')
optdepends=('gtk3: to run rsvg-view-3 viewer')
options=('!emptydirs')
url="https://live.gnome.org/LibRsvg"
install=$_pkgname.install
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha256sums=('SKIP')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

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

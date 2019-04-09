# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: mariusz - myswiat <my.swiat@o2.pl>
# Contributor:Jan de Groot <jgc@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_realname=pango
pkgname=$_realname-git
pkgver=1.43.0.r21.gbe035735
pkgrel=1
pkgdesc="A library for layout and rendering of text"
arch=('i686' 'x86_64')
url="http://gnome.org/"
license=('LGPL')
depends=('glib2' 'cairo' 'libxft' 'libthai' 'freetype2' 'harfbuzz' 'fontconfig')
makedepends=('gobject-introspection' 'libxt' 'gtk-doc' 'meson')
provides=("${_realname}=${pkgver}")
conflicts=("${_realname}")
install=${_realname}.install
options=('!libtool' 'strip' 'debug')
source=("git+https://gitlab.gnome.org/GNOME/pango" "pango.install")
sha256sums=('SKIP'
            '1e69feead9d9e5a76e7e0dc1b3da3b8938f65f58c02449478900559be50e9ac7')
 
pkgver() {
  cd $_realname
  git describe --tags | sed 's/-/.r/' |tr - .
}

build() {
  arch-meson $_realname build -D enable_docs=true 
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  rm -r "$pkgdir"/usr/{lib,share}/installed-tests
}

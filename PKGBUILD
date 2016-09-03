# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.5.1
_release=ARAVIS_0_5_1
pkgrel=1
pkgdesc="A vision library for genicam based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=(i686 x86_64)
license=(LGPL)
depends=(gtk3 libnotify gst-plugins-base-libs)
makedepends=(gobject-introspection appstream-glib)
source=(https://github.com/AravisProject/aravis/archive/${_release}.tar.gz)
md5sums=('SKIP')

prepare(){
  cd $pkgname-$_release
  sed -i 's|${prefix}/doc|${docdir}|' Makefile.am
}

build() {
  cd $pkgname-$_release
  ./autogen.sh --prefix=/usr \
               --enable-appstream-util \
               --enable-gst-plugin \
               --enable-gtk-doc \
               --enable-usb \
               --enable-viewer \
               --enable-zlib-pc \
               --disable-gst-0.10-plugin
  make
}

package() {
  cd $pkgname-$_release
  make DESTDIR="${pkgdir}" install
}

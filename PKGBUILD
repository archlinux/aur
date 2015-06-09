# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=cogl
pkgname=$_pkgname-git
pkgver=1.20.0.13.g5069f65
_realver=1.20.1
pkgrel=1
pkgdesc="A hardware accelerated 3D graphics API"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango' "wayland")
makedepends=('mesa' 'gobject-introspection' 'gtk-doc')
options=(!libtool !emptydirs)
provides=("${_pkgname}=${_realver}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
source=('git://git.gnome.org/cogl#branch=cogl-1.20')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  CC=/usr/bin/gcc ./autogen.sh --prefix=/usr --enable-cairo=yes \
               --enable-gdk-pixbuf=yes \
               --enable-cogl-pango=yes \
               --enable-cogl-gst=yes \
               --enable-glx=yes \
               --enable-xlib-egl-platform=yes \
               --enable-wayland-egl-platform=yes \
               --enable-wayland-egl-server=yes \
               --enable-kms-egl-platform \
               --enable-introspection=yes \
               --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make -j1 DESTDIR="$pkgdir" install
}

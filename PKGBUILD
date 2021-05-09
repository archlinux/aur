# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-theme
pkgver=1.5
pkgrel=1
pkgdesc="Theme and style setting utilities for the X Desktop Environment (XDE)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/xde-theme"
groups=('xde')
license=('GPL3')
depends=('libxinerama' 'gdk-pixbuf-xlib' 'libxrandr' 'libsm' 'imlib2')
optdepends=('xde-styles: for styles that work with xde-style')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('194d4d9b5d376bd850340c5d44670040c4788b993219c1fb1dda511d2508f6c7')

build() {
 cd $pkgname-$pkgver
 ./configure
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
 make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:

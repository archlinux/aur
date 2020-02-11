# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-theme
pkgver=1.4
pkgrel=1
pkgdesc="Theme and style setting utilities for the X Desktop Environment (XDE)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/xde-theme"
groups=('xde')
license=('GPL3')
depends=('libxinerama' 'gdk-pixbuf2' 'libxrandr' 'libsm' 'imlib2')
optdepends=('xde-styles: for styles that work with xde-style')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('4c4441670ca29d844b5a4edf99742f24f2a891dc92385f927d269ad29b534e4b')

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

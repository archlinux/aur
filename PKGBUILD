# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-sound
pkgver=1.0
pkgrel=1
pkgdesc="Command line XDG sound theme utilities"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/${pkgname}"
license=('GPL')
groups=('xde')
depends=('glib2' 'libcanberra')
makedepends=('pkgconfig')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('62cad962819ea6300bfe89dfc0a2f387876a98240db07314f17c9c87b26edee7')

build() {
  cd ${pkgname}-${pkgver}
  ./configure
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  make -C ${pkgname}-${pkgver} DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

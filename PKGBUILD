# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch
pkgver=1.12
pkgrel=1
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/${pkgname}"
license=('GPL')
groups=('xde')
depends=('glib2' 'libxrandr' 'libxinerama')
optdepends=('dmenu: to use dmenu_launch script')
makedepends=('pkgconfig')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('de4b84f46a3480b56236c40ac09f8dfa226fbd3b5e7d13e92b6af9fb26ddbf9d')

build() {
  cd $pkgname-$pkgver
  ./configure
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
